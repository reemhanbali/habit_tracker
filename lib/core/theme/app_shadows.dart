import 'package:flutter/material.dart';

class AppShadows {
  static final _shadowColor1 = Color(0xFF232C5D).withValues(alpha: 0.06);
  static final _shadowColor2 = Color(0xFF0B2B51).withValues(alpha: 0.2);

  /// Medium drop shadow, for cards, containers
  static List<BoxShadow> medium = [
    BoxShadow(
      color: _shadowColor1,
      offset: Offset(0, 12),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> box = [
    BoxShadow(
      color: _shadowColor1,
      offset: Offset(58, 58),
      blurRadius: 68,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> small = [
    BoxShadow(
      color: _shadowColor2,
      offset: Offset(0, 3),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];
}
