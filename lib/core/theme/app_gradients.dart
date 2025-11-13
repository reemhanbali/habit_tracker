import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';

class AppGradients {
  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      AppColors.gradientBlueStop0,
      AppColors.gradientBlueStop100,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}