import 'package:flutter/material.dart';

class CreateAccountShell extends StatelessWidget {
  final Widget child;

  CreateAccountShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
