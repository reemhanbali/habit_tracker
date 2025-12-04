import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';

class SingleChoiceBox extends StatefulWidget {
  final Widget firstOption;
  final Widget secondOption;
  final ValueChanged<int>? onSelectionChanged;
  final int initialSelectedIndex;

  const SingleChoiceBox({
    super.key,
    required this.firstOption,
    required this.secondOption,
    this.onSelectionChanged,
    this.initialSelectedIndex = -1,
  });

  @override
  State<SingleChoiceBox> createState() => _SingleChoiceBoxState();
}

class _SingleChoiceBoxState extends State<SingleChoiceBox> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  void _onTap(int index) {
    setState(() => selectedIndex = index);
    widget.onSelectionChanged?.call(index); // notify parent
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onTap(0);
            },
            child: SelectableOption(
              isSelected: selectedIndex == 0,
              child: widget.firstOption,
            ),
          ),
        ),
        SizedBox(
          width: AppDimensions.spacingLarge,
        ), // spacing between two options
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onTap(1);
            },
            child: SelectableOption(
              isSelected: selectedIndex == 1,
              child: widget.secondOption,
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
