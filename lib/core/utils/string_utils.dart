import 'package:flutter/material.dart';

extension StringUtils on String {
  /// Returns the first [count] characters safely (handles emojis)
  String firstChars(int count) {
    final chars = Characters(this);
    return chars.take(count).toString();
  }
}
