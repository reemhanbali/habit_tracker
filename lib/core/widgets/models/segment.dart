import 'package:flutter/material.dart';

class Segment<T> {
  final T value;
  final bool showBadge;
  final Widget child;

  Segment({required this.value, this.showBadge = false, required this.child});
}
