import 'package:habits_tracker_app/core/theme/app_icon_type.dart';

class BottomBarItem {
  final AppIconType activeIcon;
  final AppIconType inActiveIcon;
  final bool showDot;

  BottomBarItem({
    required this.activeIcon,
    required this.inActiveIcon,
    this.showDot = false,
  });
}
