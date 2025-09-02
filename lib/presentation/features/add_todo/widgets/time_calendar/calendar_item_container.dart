import 'package:flutter/material.dart';

class CalendarItemContainer extends StatelessWidget {
  final String mainString;
  final bool isChecked;
  final bool isToday;
  final bool isPastDate;
  final VoidCallback? onTap;

  const CalendarItemContainer({
    required this.mainString,
    this.isChecked = false,
    this.isToday = false,
    this.isPastDate = false,
    this.onTap,
    super.key,
  });

  Color get _backgroundColor {
    if (isChecked) return Colors.black;
    return Colors.transparent;
  }

  Color get _textColor {
    if (isChecked) return Colors.white;
    if (isToday) return Colors.blue;
    if (isPastDate) return Colors.grey.shade400;
    return Colors.black;
  }

  FontWeight get _fontWeight {
    if (isChecked || isToday) return FontWeight.bold;
    return FontWeight.normal;
  }

  Border? get _border {
    if (isToday && !isChecked) {
      return const Border.fromBorderSide(BorderSide(color: Colors.blue, width: 2));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(color: _backgroundColor, shape: BoxShape.circle, border: _border),
        alignment: Alignment.center,
        child: Text(
          mainString,
          style: TextStyle(color: _textColor, fontWeight: _fontWeight, fontSize: 12),
        ),
      ),
    );
  }
}
