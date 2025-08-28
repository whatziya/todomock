import 'package:flutter/material.dart';
import 'package:todomock/common/utils/calendar_info.dart';
import 'package:todomock/presentation/features/add_todo/widgets/time_calendar/calendar_item_container.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    required this.year,
    required this.month,
    required this.selectedDay,
    required this.onNextDateFrame,
    required this.onPreviousDateFrame,
    required this.onDayTap,
    super.key,
  });

  final int year;
  final int month;
  final int selectedDay;
  final VoidCallback onNextDateFrame;
  final VoidCallback onPreviousDateFrame;
  final void Function(int day) onDayTap;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late List<int> calendarInfo;

  static const List<String> monthNames = [
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

  @override
  void initState() {
    super.initState();
    _updateCalendar();
  }

  @override
  void didUpdateWidget(CalendarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update calendar when year or month changes from parent
    if (widget.year != oldWidget.year || widget.month != oldWidget.month) {
      _updateCalendar();
    }
  }

  void _updateCalendar() {
    calendarInfo = CalendarInfoUtils.calendarInfo(widget.year, widget.month);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          left: BorderSide(),
          top: BorderSide(),
          right: BorderSide(),
          bottom: BorderSide(width: 5),
        ),
        borderRadius: BorderRadius.circular(14),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: widget.onPreviousDateFrame,
                ),
                const Spacer(),
                Text(
                  '${monthNames[widget.month - 1]} ${widget.year}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: widget.onNextDateFrame,
                ),
              ],
            ),
          ),

          const Divider(color: Colors.black, height: 1),
          const SizedBox(height: 16),

          // Weekday labels
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalendarItemContainer(mainString: 'S'),
              CalendarItemContainer(mainString: 'M'),
              CalendarItemContainer(mainString: 'T'),
              CalendarItemContainer(mainString: 'W'),
              CalendarItemContainer(mainString: 'T'),
              CalendarItemContainer(mainString: 'F'),
              CalendarItemContainer(mainString: 'S'),
            ],
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
            itemCount: calendarInfo.length,
            itemBuilder: (context, index) {
              final day = calendarInfo[index];
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              final dateForDay = DateTime(widget.year, widget.month, day);
              final isPastDate = day != 0 && dateForDay.isBefore(today);
              final isToday = day != 0 && dateForDay.isAtSameMomentAs(today);

              return CalendarItemContainer(
                mainString: day == 0 ? ' ' : day.toString(),
                isChecked: day != 0 && day == widget.selectedDay,
                isToday: isToday,
                isPastDate: isPastDate,
                onTap: (day == 0 || isPastDate)
                    ? null
                    : () {
                  widget.onDayTap(day);
                },
              );
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
