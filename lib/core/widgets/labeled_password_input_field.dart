import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/widgets/basic_labeled_input_field.dart';

class LabeledPasswordInputField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? minLength;
  final int? maxLength;

  LabeledPasswordInputField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.minLength,
    this.maxLength,
  });

  @override
  State<LabeledPasswordInputField> createState() =>
      _LabeledPasswordInputFieldState();
}

class _LabeledPasswordInputFieldState extends State<LabeledPasswordInputField> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return BasicLabeledInputField(
      label: widget.label,
      controller: _controller,
      validator: widget.validator,
      hint: widget.hint,
      maxLength: widget.maxLength,
      minLength: widget.minLength,
      obscureText: true,
    );
  }
}
