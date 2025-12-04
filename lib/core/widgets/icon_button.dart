import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/widgets/models/icon_button_size.dart';
import 'package:habits_tracker_app/core/widgets/models/icon_button_type.dart';

class CustomIconButton extends StatefulWidget {
  final IconButtonSize iconButtonSize;
  final IconButtonType iconButtonType;
  final VoidCallback? onTap;
  final String icon;
  double _dimension = 0;

  CustomIconButton({
    super.key,
    this.iconButtonSize = IconButtonSize.medium,
    this.iconButtonType = IconButtonType.icon,
    this.onTap,
    required this.icon,
  }) {
    _dimension = _getDimension(iconButtonSize);
  }

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();

  double _getDimension(IconButtonSize buttonSize) {
    switch (buttonSize) {
      case IconButtonSize.large:
        return _largeSize;

      case IconButtonSize.small:
        return _smallSize;

      default:
        return _mediumSize;
    }
  }
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget._dimension,
      height: widget._dimension,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isActive = true), // pressed
        onTapUp: (_) => setState(() => _isActive = false), // released
        onTapCancel: () => setState(() => _isActive = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: _getPadding(widget.iconButtonSize),
          decoration: BoxDecoration(
            color: _isActive
                ? AppColors.primaryBlue10
                : AppColors.primaryBaseWhite,
            border: Border.all(
              color: _isActive
                  ? AppColors.primaryBlue100
                  : AppColors.primaryBlack10,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          ),
          child: SvgPicture.asset(
            widget.icon,
            width: _iconSize,
            height: _iconSize,
          ),
        ),
      ),
    );
  }

  EdgeInsets _getPadding(IconButtonSize buttonSize) {
    switch (buttonSize) {
      case IconButtonSize.large:
      case IconButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 12, vertical: 12);
      default:
        return EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingXSmall,
          vertical: AppDimensions.spacingXSmall,
        );
    }
  }
}

const double _smallSize = 36;
const double _mediumSize = 40;
const double _largeSize = 48;
const double _iconSize = 20;
