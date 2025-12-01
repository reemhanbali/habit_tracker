import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  /*  final bool showSegmentControl;
  final bool showProfile;
  final bool showTopContent;
  final bool showDatePicker; */

  const Header({
    super.key,
    this.title,
    this.leftIcon,
    this.rightIcon,
    /*  this.showSegmentControl = false,
    this.showProfile = false,
    this.showTopContent = false,
    this.showDatePicker = false, */
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (leftIcon != null) leftIcon!,
          if (title != null) title!,
          if (rightIcon != null) rightIcon!,
        ],
      ),
      centerTitle: true,
      titleTextStyle: AppTextStyles.headline5.copyWith(
        color: AppColors.primaryBlack100,
      ),
      titleSpacing: AppDimensions.spacingMedium,
      actions: rightIcon == null ? [] : [rightIcon!],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
