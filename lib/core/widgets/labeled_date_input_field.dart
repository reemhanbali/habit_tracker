import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/widgets/basic_labeled_input_field.dart';
import 'package:intl/intl.dart';

class LabeledDateInputField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onDateSelected;
  final String? Function(String?)? validator;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  LabeledDateInputField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.onDateSelected,
    this.validator,
    this.firstDate,
    this.lastDate,
    this.initialDate,
  });

  void _onDateSelected(DateTime date) {
    String formattedDate = DateFormat('MM/dd/yyyy').format(date);
    controller?.text = formattedDate;
    onDateSelected?.call(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return BasicLabeledInputField(
      label: label,
      controller: controller,
      readOnly: true,
      validator: validator,
      hint: hint,
      keyboardType: TextInputType.datetime,
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate ?? LabeledDateInputField._defaultInitialDate,
          firstDate: firstDate ?? LabeledDateInputField._defaultFirstDate,
          lastDate: lastDate ?? LabeledDateInputField._defaultLastDate,
        );

        if (pickedDate != null) {
          _onDateSelected(pickedDate);
        }
      },
    );
  }

  static DateTime _defaultInitialDate = DateTime.now();
  static DateTime _defaultFirstDate = DateTime(1970);
  static DateTime _defaultLastDate = DateTime(2100);
}
