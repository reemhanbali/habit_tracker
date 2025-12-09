import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/widgets/bottom_bar.dart';
import 'package:habits_tracker_app/core/widgets/models/bottom_bar_item.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

class MainShell extends StatelessWidget {
  MainShell({super.key, required this.child});
  final Widget child;

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path; // just path
    // Find the first route that matches the start of the location
    return AppRoutes.bottomNavRoutes
        .indexWhere((route) => location.startsWith(route))
        .clamp(0, AppRoutes.bottomNavRoutes.length - 1);
  }

  void _onBottomItemTapped(BuildContext context, int index) {
    context.go(AppRoutes.bottomNavRoutes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child, // <-- displays the current route
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMedium,
          vertical: AppDimensions.spacingMedium,
        ),
        child: BottomBar(
          items: [
            BottomBarItem(
              activeIcon: AppIconType.activeHome,
              inActiveIcon: AppIconType.inactiveHome,
            ),
            BottomBarItem(
              activeIcon: AppIconType.activeDiscovery,
              inActiveIcon: AppIconType.inactiveDiscovery,
            ),
            BottomBarItem(
              activeIcon: AppIconType.activeMedal,
              inActiveIcon: AppIconType.inactiveMedal,
            ),
            BottomBarItem(
              activeIcon: AppIconType.activeProfile,
              inActiveIcon: AppIconType.inactiveProfile,
            ),
          ],
          currentIndex: _getSelectedIndex(context),
          onTap: (index) => _onBottomItemTapped(context, index),
        ),
      ),
    );
  }
}
