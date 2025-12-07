import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/widgets/basic_labeled_input_field.dart';

class LabeledTextInputField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final int? minLength;
  final int? maxLength;
  final bool readOnly;
  final TextInputType keyboardType;

  LabeledTextInputField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.isEnabled = true,
    this.minLength,
    this.maxLength,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<LabeledTextInputField> createState() => _LabeledTextInputFieldState();
}

class _LabeledTextInputFieldState extends State<LabeledTextInputField> {
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
      isEnabled: widget.isEnabled,
      readOnly: widget.readOnly,
    );
  }
}
