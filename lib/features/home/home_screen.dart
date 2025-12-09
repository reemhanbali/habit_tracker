import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        leftIcon: AppIconType.calendar,
        rightIcon: AppIconType.notification,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen A'),
            TextButton(onPressed: () {}, child: const Text('View A details')),
          ],
        ),
      ),
    );
  }
}
