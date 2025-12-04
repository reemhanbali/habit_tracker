import 'package:flutter/material.dart';

class WidgetPreviewScreen extends StatelessWidget {
  final Widget child;

  const WidgetPreviewScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Preview')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child, // your widget goes here
        ),
      ),
    );
  }
}
