import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/utils/date_utils.dart';
import 'package:habits_tracker_app/core/widgets/calendar_day.dart';

class CalendarDaysList extends StatefulWidget {
  final List<DateTime> days;

  const CalendarDaysList({super.key, required this.days});

  @override
  State<CalendarDaysList> createState() => _CalendarDaysListState();
}

class _CalendarDaysListState extends State<CalendarDaysList> {
  int _selectedIndex = -1; // index of selected day

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _listHeight,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.days.length,
        separatorBuilder: (_, _) =>
            const SizedBox(width: AppDimensions.spacingSmall),
        itemBuilder: (context, index) {
          ({int day, String name}) dayLabel = _getDayLabel(widget.days[index]);
          return Row(
            children: [
              CalendarDay(
                dayNumber: dayLabel.day,
                dayName: dayLabel.name,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                isSelected: _selectedIndex == index,
              ), // your custom day widget
            ],
          );
        },
      ),
    );
  }

  ({int day, String name}) _getDayLabel(DateTime date) {
    final dayNumber = date.day; // 1..31
    final dayName = weekDayName(date.weekday); // Monday, Tuesday, etc.
    return (day: dayNumber, name: dayName);
  }

  static const double _listHeight = 68;
}
