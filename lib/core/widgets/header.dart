import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/icon_button.dart';
import 'package:habits_tracker_app/core/widgets/models/icon_button_size.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppIconType? leftIcon;
  final AppIconType? rightIcon;
  final VoidCallback? onLeftIconTap;
  final VoidCallback? onRightIconTap;

  /*  final bool showSegmentControl;
  final bool showProfile;
  final bool showTopContent;
  final bool showDatePicker; */

  const Header({
    super.key,
    this.title,
    this.leftIcon,
    this.rightIcon,
    this.onLeftIconTap,
    this.onRightIconTap,
    /*  this.showSegmentControl = false,
    this.showProfile = false,
    this.showTopContent = false,
    this.showDatePicker = false, */
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.primaryBlack10, width: 1),
        ),
      ),
      child: AppBar(
        backgroundColor: AppColors.primaryBaseWhite,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: AppDimensions.spacingSmall,
          children: [
            if (leftIcon != null)
              CustomIconButton(
                icon: leftIcon!,
                iconButtonSize: IconButtonSize.large,
                onTap: () {
                  if (onLeftIconTap != null) {
                    onLeftIconTap!(); // call the callback
                  } else {
                    Navigator.pop(context); // default action
                  }
                },
              ),
            if (title != null) Text(title!),
            if (rightIcon != null)
              CustomIconButton(
                icon: rightIcon!,
                onTap: onRightIconTap,
                iconButtonSize: IconButtonSize.large,
              ),
          ],
        ),
        titleTextStyle: AppTextStyles.headline5.copyWith(
          color: AppColors.primaryBlack100,
        ),
        titleSpacing: AppDimensions.spacingMedium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_headerHeight);

  static const double _headerHeight = 60;
}
