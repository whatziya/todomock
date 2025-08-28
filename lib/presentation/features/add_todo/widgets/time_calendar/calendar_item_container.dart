import 'package:flutter/material.dart';

class CalendarItemContainer extends StatelessWidget {
  const CalendarItemContainer({
    required this.mainString,
    this.isChecked = false,
    this.isToday = false,
    this.isPastDate = false,
    this.onTap,
    super.key,
  });

  final String mainString;
  final bool isChecked;
  final bool isToday;
  final bool isPastDate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Colors.transparent;
    var textColor = Colors.black;
    var fontWeight = FontWeight.normal;
    Border? border;

    if (isChecked) {
      backgroundColor = Colors.black;
      textColor = Colors.white;
      fontWeight = FontWeight.bold;
    } else if (isToday) {
      border = Border.all(color: Colors.blue, width: 2);
      textColor = Colors.blue;
      fontWeight = FontWeight.bold;
    } else if (isPastDate) {
      textColor = Colors.grey.shade400;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: border,
        ),
        alignment: Alignment.center,
        child: Text(
          mainString,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
