import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/utils/date_utils.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/icon_button.dart';
import 'package:habits_tracker_app/core/widgets/models/date_type.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final DateType dateType;
  final DateTime date;
  final Function() nextDate;
  final Function() previousDate;

  const DatePicker({
    super.key,
    required this.dateType,
    required this.date,
    required this.nextDate,
    required this.previousDate,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late ({DateTime start, DateTime end, String label, String value})
  selectedDateRange;

  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = widget.date;
    selectedDateRange = _getSelectedDateRange(widget.dateType, widget.date);
  }

  void _nextDate() {
    switch (widget.dateType) {
      case DateType.week:
        {
          final nextWeekDate = nextWeek(selectedDateRange.start);

          setState(() {
            selectedDateRange = _getSelectedDateRange(
              widget.dateType,
              nextWeekDate,
            );
          });
        }

      case DateType.month:
        {
          final nextMonthDate = nextMonth(selectedDateRange.start);

          setState(() {
            selectedDateRange = _getSelectedDateRange(
              widget.dateType,
              nextMonthDate,
            );
          });
        }
      case DateType.year:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  void _previousDate() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              selectedDateRange.label,
              style: AppTextStyles.paragraphMedium.copyWith(
                color: AppColors.primaryBlack100,
              ),
            ),
            Text(
              selectedDateRange.value,
              style: AppTextStyles.alternative.copyWith(
                color: AppColors.primaryBlack60,
              ),
            ),
          ],
        ),
        CustomIconButton(
          onTap: () {
            widget.previousDate();
          },
          icon: AssetIcon(AppIconType.arrowLeft.assetPath),
        ),
        CustomIconButton(
          onTap: () {
            widget.nextDate();
          },
          icon: AssetIcon(AppIconType.arrowRight.assetPath),
        ),
      ],
    );
  }

  ({DateTime start, DateTime end, String label, String value})
  _getSelectedDateRange(DateType dateType, DateTime date) {
    switch (dateType) {
      case DateType.week:
        {
          final label = isThisWeek(date) ? "This week" : getWeekOfMonth(date);
          final weekRange = getWeekRange(date);
          final value =
              "${DateFormat('MMM dd').format(weekRange.start)} - ${DateFormat('MMM dd').format(weekRange.end)}";
          return (
            start: weekRange.start,
            end: weekRange.end,
            label: label,
            value: value,
          );
        }
      case DateType.month:
        {
          final label = isThisMonth(date) ? "This month" : getMonthName(date);
          final monthRange = getMonthDateRange(date);
          final value =
              "${DateFormat('MMM dd').format(monthRange.start)} - ${DateFormat('MMM dd').format(monthRange.end)}";
          return (
            start: monthRange.start,
            end: monthRange.end,
            label: label,
            value: value,
          );
        }
      case DateType.year:
        {
          final yearRange = getYearRangeForDate(date);
          final label = isThisYear(date) ? "This year" : getYear(date);
          final value =
              "${DateFormat('MMM dd yyyy').format(yearRange.start)} - ${DateFormat('MMM dd yyyy').format(yearRange.end)}";
          return (
            start: yearRange.start,
            end: yearRange.end,
            label: label,
            value: value,
          );
        }
    }
  }
}
