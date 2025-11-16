import 'package:flutter/material.dart';

import 'package:habits_tracker_app/core/theme/app_dimens.dart';

class AppTextStyles {
  static const String fontFamily = "Montserrat";

  static TextStyle headline1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size48,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 56,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size40,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 48,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size36,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 40,
  );

  static TextStyle headline4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size32,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 40,
  );

  static TextStyle headline5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size24,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: -1,
    height: 32,
  );

  static TextStyle headline6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size20,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0,
    height: 24,
  );

  static TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size18,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0,
    height: 24,
  );

  static TextStyle paragraphBook = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size14,
    fontWeight: FontWeight.w400, // Book or Regular
    letterSpacing: 0,
    height: 20,
  );

  static TextStyle paragraphMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size14,
    fontWeight: FontWeight.w500, // Medium
    letterSpacing: 0,
    height: 20,
  );

  static TextStyle alternative = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size12,
    fontWeight: FontWeight.w400, // Book or Regular
    letterSpacing: 0,
    height: 16,
  );

  static TextStyle chip = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimens.size10,
    fontWeight: FontWeight.w700, // Bold
    letterSpacing: 1,
    height: 16,
  );
}