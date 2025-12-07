import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/utils/validators.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/labeled_date_input_field.dart';
import 'package:habits_tracker_app/core/widgets/labeled_text_input_field.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';

class EnterInformationScreen extends StatelessWidget {
  EnterInformationScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final _birthdateController =
      TextEditingController(); // Controller for TextFormField
  final _firstNameController =
      TextEditingController(); // Controller for TextFormField
  final _surnameController =
      TextEditingController(); // Controller for TextFormField

  final firstNameValidators = [
    Validators.required(fieldName: "First Name"),
    Validators.minLength(min: _nameMinLength),
    Validators.maxLength(max: _nameMaxLength),
  ];

  final lastNameValidators = [
    Validators.required(fieldName: "Surname"),
    Validators.email(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Continue with E-mail",
        leftIcon: AppIconType.arrowLeft.assetPath,
      ),
      body: BodyWrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingLarge,
            vertical: AppDimensions.spacingSmall,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.spacingSmall,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      spacing: AppDimensions.spacingMedium,
                      children: [
                        LabeledTextInputField(
                          label: "Name",
                          hint: "Enter your first name",
                          minLength: _nameMinLength,
                          maxLength: _nameMaxLength,
                          controller: _firstNameController,
                          keyboardType: TextInputType.name,
                          validator: Validators.required(
                            fieldName: "First name",
                          ),
                        ),
                        LabeledTextInputField(
                          label: "Surname",
                          hint: "Enter your surname",
                          keyboardType: TextInputType.name,
                          minLength: _nameMinLength,
                          controller: _surnameController,
                          maxLength: _nameMaxLength,
                          validator: Validators.required(fieldName: "Surname"),
                        ),
                        LabeledDateInputField(
                          label: "Birthdate",
                          hint: "MM/dd/yyyy",
                          controller: _birthdateController,
                          validator: Validators.required(
                            fieldName: "Birth date",
                          ),
                          onDateSelected: (value) => {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              PrimaryButton(
                text: "Next",
                fullWidth: true,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // All fields are valid
                    print(
                      "Name :${_firstNameController.text} ${_surnameController.text}",
                    );
                    print("DOB: ${_birthdateController.text}");
                  }
                },
                buttonSize: ButtonSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const _nameMinLength = 8;
  static const _nameMaxLength = 15;
}
