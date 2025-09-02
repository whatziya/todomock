import 'package:flutter/material.dart';
import 'package:todomock/common/utils/calendar_info.dart';
import 'package:todomock/presentation/features/add_todo/widgets/time_calendar/calendar_item_container.dart';

class CalendarWidget extends StatefulWidget {
  final int year;
  final int month;
  final int selectedDay;
  final VoidCallback onNextDateFrame;
  final VoidCallback onPreviousDateFrame;
  final void Function(int day) onDayTap;

  const CalendarWidget({
    required this.year,
    required this.month,
    required this.selectedDay,
    required this.onNextDateFrame,
    required this.onPreviousDateFrame,
    required this.onDayTap,
    super.key,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  static const List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  static const List<String> _weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  late List<int> _calendarInfo;

  @override
  void initState() {
    super.initState();
    _updateCalendar();
  }

  @override
  void didUpdateWidget(CalendarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.year != oldWidget.year || widget.month != oldWidget.month) {
      _updateCalendar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(),
          top: BorderSide(),
          right: BorderSide(),
          bottom: BorderSide(width: 5),
        ),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          // Header with navigation
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 32),
                  onPressed: widget.onPreviousDateFrame,
                ),
                const Spacer(),
                Text(
                  '${_monthNames[widget.month - 1]} ${widget.year}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 32),
                  onPressed: widget.onNextDateFrame,
                ),
              ],
            ),
          ),

          const Divider(color: Colors.black, height: 1),
          const SizedBox(height: 16),

          // Weekday labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _weekDays.map((day) => CalendarItemContainer(mainString: day)).toList(),
          ),
          const SizedBox(height: 4),

          // Calendar days
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 2,
            ),
            itemCount: _calendarInfo.length,
            itemBuilder: (context, index) {
              final day = _calendarInfo[index];
              if (day == 0) {
                return const CalendarItemContainer(mainString: ' ');
              }
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              final dateForDay = DateTime(widget.year, widget.month, day);
              final isPastDate = dateForDay.isBefore(today);
              final isToday = dateForDay.isAtSameMomentAs(today);

              return CalendarItemContainer(
                mainString: day.toString(),
                isChecked: day == widget.selectedDay,
                isToday: isToday,
                isPastDate: isPastDate,
                onTap: isPastDate ? null : () => widget.onDayTap(day),
              );
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _updateCalendar() {
    _calendarInfo = CalendarInfoUtils.calendarInfo(widget.year, widget.month);
  }
}
