import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.router});

  final GoRouter router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return MaterialApp.router(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router, // GoRouter instance
    );
  }
}
