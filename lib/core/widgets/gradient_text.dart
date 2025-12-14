import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  final TextAlign? textAlign;
  final int? maxLines;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    required this.gradient,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = style.fontSize ?? 14;
        return Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          style: style.copyWith(
            foreground: Paint()
              ..shader = gradient.createShader(
                Rect.fromLTWH(0, 0, constraints.maxWidth, height),
              ),
          ),
        );
      },
    );
  }
}
