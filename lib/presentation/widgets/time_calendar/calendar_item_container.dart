import 'package:flutter/material.dart';

class CalendarItemContainer extends StatelessWidget {
  const CalendarItemContainer({
    required this.mainString,
    this.isChecked = false,
    this.onTap,
    super.key,
  });

  final String mainString;
  final bool isChecked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: isChecked ? Colors.black : Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          mainString,
          style: TextStyle(
            color: isChecked ? Colors.white : Colors.black,
            fontWeight: isChecked ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
