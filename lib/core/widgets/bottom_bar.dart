import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_gradients.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_shadows.dart';
import 'package:habits_tracker_app/core/widgets/icon_button.dart';
import 'package:habits_tracker_app/core/widgets/models/bottom_bar_item.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomBarItem> items;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLarge,
        vertical: AppDimensions.spacingSmall,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        border: BoxBorder.all(width: 0.5, color: AppColors.primaryBlack20),
        color: AppColors.primaryBaseWhite,
        boxShadow: AppShadows.box,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildItems(),
      ),
    );
  }

  List<Widget> _buildItems() {
    final middle = (items.length ~/ 2) - 1;
    List<Widget> widgets = [];

    for (int index = 0; index < items.length; index++) {
      widgets.add(_buildItem(index: index, item: items[index]));
      if (index == middle) {
        widgets.add(AddButton(onTap: () {}));
      }
    }
    return widgets;
  }

  Widget _buildItem({required int index, required BottomBarItem item}) {
    final bool selected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: AppDimensions.spacingLarge,
        height: AppDimensions.spacingLarge,
        child: selected
            ? SvgPicture.asset(item.activeIcon.assetPath)
            : SvgPicture.asset(item.inActiveIcon.assetPath),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  final Function() onTap;

  const AddButton({super.key, required this.onTap});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (details) {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      onTap: () {
        widget.onTap();
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: _isPressed
              ? AppGradients.blueGradient
              : AppGradients.darkBlueGradient,
          boxShadow: AppShadows.box,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIconType.add.assetPath,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBaseWhite,
              BlendMode.dstIn,
            ),
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
