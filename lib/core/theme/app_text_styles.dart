import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';

class AppTextStyles {
  static const String fontFamily = "Montserrat";

  static TextStyle headline1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size48,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 1.16,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size40,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 1.2,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size36,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 1.1,
  );

  static TextStyle headline4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size32,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 1.25,
  );

  static TextStyle headline5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size24,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 1.33,
  );

  static TextStyle headline6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size20,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0,
    height: 1.2,
  );

  static TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size18,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0,
    height: 1.33,
  );

  static TextStyle paragraphBook = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size14,
    fontWeight: FontWeight.w400, // Book or Regular
    letterSpacing: 0,
    height: 1.42,
  );

  static TextStyle paragraphMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size14,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0,
    height: 1.42,
  );

  static TextStyle alternative = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size12,
    fontWeight: FontWeight.w400, // Book or Regular
    letterSpacing: 0,
    height: 1.33,
  );

  static TextStyle chip = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.size10,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: 1,
    height: 1.6,
  );
}
