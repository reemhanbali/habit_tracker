import 'package:flutter/material.dart';

class Segment<T> {
  final T value;
  final Widget child;

  Segment({required this.value, required this.child});
}
