import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onBottomItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
