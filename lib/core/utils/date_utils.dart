import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime getFirstDayOfWeek(DateTime date) {
  return date.subtract(Duration(days: date.weekday - 1));
}

/// Returns the last day of the week (Sunday by default)
DateTime getLastDayOfWeek(DateTime date) {
  final firstDay = getFirstDayOfWeek(date);
  return firstDay.add(Duration(days: 6));
}

DateTime startOfMonth(DateTime date) {
  return DateTime(date.year, date.month, 1);
}

DateTime startOfYear(DateTime date) {
  return DateTime(date.year, 1, 1);
}

int weekNumber(DateTime date) {
  final firstDayOfYear = DateTime(date.year, 1, 1);
  final days = date.difference(firstDayOfYear).inDays;
  return ((days + firstDayOfYear.weekday) / 7).ceil();
}

bool isToday(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

/// Returns true if [date] is in the current week (Monday → Sunday)
bool isThisWeek(DateTime date) {
  final now = DateTime.now();

  // Start of current week (Monday)
  final startOfWeek = getFirstDayOfWeek(now);

  // End of current week (Sunday)
  final endOfWeek = getLastDayOfWeek(now);

  // Check if date is between start and end of week (inclusive)
  return date.isAfter(startOfWeek.subtract(Duration(seconds: 1))) &&
      date.isBefore(endOfWeek.add(Duration(days: 1)));
}

bool isThisMonth(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year && date.month == now.month;
}

String getWeekOfMonth(DateTime date) {
  // Get the first day of the month
  final firstDayOfMonth = DateTime(date.year, date.month, 1);
  // weekday: Monday = 1 ... Sunday = 7
  // Adjust firstDayOfMonth.weekday to start counting from Monday
  int adjustedDay = firstDayOfMonth.weekday % 7;
  return "${((date.day + adjustedDay - 1) / 7).ceil()}";
}

/// Returns the start and end date of the week for [date].
/// Week starts on Monday and ends on Sunday.
DateTimeRange getWeekRange(DateTime date) {
  // Start of week (Monday)
  final startOfWeek = date.subtract(Duration(days: date.weekday - 1));

  // End of week (Sunday)
  final endOfWeek = startOfWeek.add(Duration(days: 6));

  return DateTimeRange(start: startOfWeek, end: endOfWeek);
}

String getMonthName(DateTime date) {
  return DateFormat.MMM().format(date);
}

/// Returns the start and end date of a given month in a given year
DateTimeRange getMonthDateRange(DateTime date) {
  final start = DateTime(date.year, date.month, 1);
  final end = (date.month < 12)
      ? DateTime(date.year, date.month + 1, 1).subtract(Duration(days: 1))
      : DateTime(date.year, 12, 31);
  return DateTimeRange(start: start, end: end);
}

bool isThisYear(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year;
}

String getYear(DateTime date) {
  return "${date.year}";
}

/// Returns the start and end date of the year for [date]
DateTimeRange getYearRangeForDate(DateTime date) {
  final start = DateTime(date.year, 1, 1);
  final end = DateTime(date.year, 12, 31);
  return DateTimeRange(start: start, end: end);
}

DateTime nextWeek(DateTime date) {
  final nextWeekDate = date.add(const Duration(days: 7));
  final int weekday = nextWeekDate.weekday; // Monday = 1, Sunday = 7
  return nextWeekDate.subtract(Duration(days: weekday - 1)); // Monday
}

DateTime nextMonth(DateTime date) {
  return (date.month == 12)
      ? DateTime(date.year + 1, 1, 1)
      : DateTime(date.year, date.month + 1, 1);
}

DateTime nextYear(DateTime date) {
  return DateTime(date.year + 1, 1, 1);
}

DateTime previousWeek(DateTime date) {
  // Find this week's Monday
  final int weekday = date.weekday; // Monday = 1, Sunday = 7
  final thisWeekStart = date.subtract(Duration(days: weekday - 1));

  // Previous week's start (Monday)
  final previousWeekStart = thisWeekStart.subtract(const Duration(days: 7));

  return previousWeekStart.add(const Duration(days: 6));
}

DateTime previousMonth(DateTime date) {
  // Calculate previous month
  final prevMonth = (date.month == 1) ? 12 : date.month - 1;
  final year = (date.month == 1) ? date.year - 1 : date.year;
  return DateTime(year, prevMonth + 1, 0); // last day of month
}

DateTime previousYear(DateTime date) {
  return DateTime(date.year - 1, 1, 1);
}
