import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';

class BodyWrapper extends StatelessWidget {
  final Widget child;
  final bool includeBottomPadding;
  final Color backgroundColor;

  const BodyWrapper({
    super.key,
    required this.child,
    this.includeBottomPadding = false,
    this.backgroundColor = AppColors.primaryBlack10,
  });

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: padding.top,
          bottom: includeBottomPadding ? padding.bottom : 0,
        ),
        child: child,
      ),
    );
  }
}
