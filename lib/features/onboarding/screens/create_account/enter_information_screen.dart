import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/utils/validators.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/labeled_date_input_field.dart';
import 'package:habits_tracker_app/core/widgets/labeled_text_input_field.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

class EnterInformationScreen extends StatefulWidget {
  EnterInformationScreen({super.key});
  @override
  State<EnterInformationScreen> createState() => _EnterInformationScreenState();

  static const _nameMinLength = 3;
  static const _nameMaxLength = 15;
}

class _EnterInformationScreenState extends State<EnterInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;

  final _birthdateController = TextEditingController();
  // Controller for TextFormField
  final _firstNameController = TextEditingController();
  // Controller for TextFormField
  final _lastNameController = TextEditingController();
  // Controller for TextFormField

  final firstNameValidators = [
    Validators.required(fieldName: "First name"),
    Validators.minLength(min: EnterInformationScreen._nameMinLength),
    Validators.maxLength(max: EnterInformationScreen._nameMaxLength),
  ];

  final lastNameValidators = [
    Validators.required(fieldName: "Last name"),
    Validators.minLength(min: EnterInformationScreen._nameMinLength),
    Validators.maxLength(max: EnterInformationScreen._nameMaxLength),
  ];

  final birthdateValidators = [Validators.required(fieldName: "Birth date")];

  // Controller for TextFormField
  void _checkFormValid() {
    final firstNameOk =
        validate(firstNameValidators, _firstNameController.text) == null;
    final lastNameOk =
        validate(lastNameValidators, _lastNameController.text) == null;
    final birthdateOk =
        validate(birthdateValidators, _birthdateController.text) == null;

    setState(() {
      _isValid = firstNameOk && lastNameOk && birthdateOk;
    });
  }

  void _onNext() {
    if (_formKey.currentState!.validate()) {
      context.go(AppRoutes.createAccountStep2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Continue with E-mail",
        leftIcon: AssetIcon(AppIconType.arrowLeft.assetPath),
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
                          minLength: EnterInformationScreen._nameMinLength,
                          maxLength: EnterInformationScreen._nameMaxLength,
                          controller: _firstNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) =>
                              validate(firstNameValidators, value),
                          onChanged: (value) => _checkFormValid(),
                        ),
                        LabeledTextInputField(
                          label: "Surname",
                          hint: "Enter your surname",
                          keyboardType: TextInputType.name,
                          minLength: EnterInformationScreen._nameMinLength,
                          controller: _lastNameController,
                          maxLength: EnterInformationScreen._nameMaxLength,
                          validator: (value) =>
                              validate(lastNameValidators, value),
                          onChanged: (value) => _checkFormValid(),
                        ),
                        LabeledDateInputField(
                          label: "Birthdate",
                          hint: "MM/dd/yyyy",
                          controller: _birthdateController,
                          validator: (value) =>
                              validate(birthdateValidators, value),
                          onDateSelected: (value) => _checkFormValid(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              PrimaryButton(
                text: "Next",
                fullWidth: true,
                onTap: _isValid ? _onNext : null,
                buttonSize: ButtonSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
