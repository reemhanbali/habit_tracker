import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';

class SingleChoiceBox extends StatelessWidget {
  final Widget firstOption;
  final Widget secondOption;
  final ValueChanged<int>? onSelectionChanged;
  final int selectedIndex;

  const SingleChoiceBox({
    super.key,
    required this.firstOption,
    required this.secondOption,
    this.onSelectionChanged,
    this.selectedIndex = -1,
  });

  void _onTap(int index) {
    onSelectionChanged?.call(index); // notify parent
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onTap(_firstChildIndex);
            },
            child: SelectableOption(
              isSelected: selectedIndex == _firstChildIndex,
              child: firstOption,
            ),
          ),
        ),
        SizedBox(
          width: AppDimensions.spacingLarge,
        ), // spacing between two options
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onTap(_secondChildIndex);
            },
            child: SelectableOption(
              isSelected: selectedIndex == _secondChildIndex,
              child: secondOption,
            ),
          ),
        ),
      ],
    );
  }
}

class SelectableOption extends StatelessWidget {
  final Widget child;
  final bool isSelected;

  const SelectableOption({
    super.key,
    required this.child,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBaseWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: isSelected
            ? Border.all(color: AppColors.primaryBlue100, width: 2)
            : null,
      ),
      child: child,
    );
  }
}

const double gridCellHeight = 134;
const int _firstChildIndex = 0;
const int _secondChildIndex = 1;
