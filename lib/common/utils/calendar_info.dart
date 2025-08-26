class CalendarInfoUtils {
  static List<int> calendarInfo(int year, int month) {
    final firstWeekday = DateTime(year, month).weekday;

    final daysInMonth = DateTime(year, month + 1, 0).day;

    final prefixZeros = firstWeekday % 7;

    return List<int>.generate(
      prefixZeros + daysInMonth,
          (i) => i < prefixZeros ? 0 : (i - prefixZeros + 1),
    );
  }
}
