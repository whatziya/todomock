import 'package:flutter/material.dart';
import 'package:todomock/common/utils/calendar_info.dart';
import 'package:todomock/presentation/widgets/time_calendar/calendar_item_container.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late List<int> calendarInfo;
  late int year;
  late int month;
  late int today;
  int? selectedDay;

  static const List<String> monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    year = now.year;
    month = now.month;
    today = now.day;
    selectedDay = today;
    _updateCalendar();
  }

  void _updateCalendar() {
    calendarInfo = CalendarInfoUtils.calendarInfo(year, month);
  }

  void _nextDateFrame() {
    setState(() {
      if (month == 12) {
        year++;
        month = 1;
      } else {
        month++;
      }
      _updateCalendar();
    });
  }

  void _previousDateFrame() {
    setState(() {
      if (month == 1) {
        year--;
        month = 12;
      } else {
        month--;
      }
      _updateCalendar();
    });
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
                  icon: const Icon(Icons.keyboard_arrow_left,
                      color: Colors.black, size: 32),
                  onPressed: _previousDateFrame,
                ),
                const Spacer(),
                Text(
                  '${monthNames[month - 1]} $year',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_right,
                      color: Colors.black, size: 32),
                  onPressed: _nextDateFrame,
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
              return CalendarItemContainer(
                mainString: day == 0 ? ' ' : day.toString(),
                isChecked: day != 0 && day == selectedDay,
                onTap: day == 0
                    ? null
                    : () {
                  setState(() {
                    selectedDay = day;
                  });
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
