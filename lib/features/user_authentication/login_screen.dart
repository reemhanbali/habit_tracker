import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/utils/validators.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/labeled_password_input_field.dart';
import 'package:habits_tracker_app/core/widgets/labeled_text_input_field.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isValid = false;

  final emailValidators = [
    Validators.required(fieldName: "Email"),
    Validators.email(),
  ];

  final passwordValidators = [Validators.required(fieldName: "Password")];

  final _emailController =
      TextEditingController(); // Controller for TextFormField
  final _passwordController =
      TextEditingController(); // Controller for TextFormField

  void _checkFormValid() {
    final emailOk = validate(emailValidators, _emailController.text) == null;
    final passwordOk =
        validate(passwordValidators, _passwordController.text) == null;

    setState(() {
      _isValid = emailOk && passwordOk;
    });
  }

  void _onCreateAccountClick() {
    context.push(AppRoutes.createAccountStep1);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  child: Column(
                    spacing: AppDimensions.spacingMedium,
                    children: [
                      LabeledTextInputField(
                        label: "E-Mail",
                        hint: "Enter your email",
                        keyboardType:
                            TextInputType.emailAddress, // Email keyboard
                        validator: (value) => validate(emailValidators, value),
                        controller: _emailController,
                        onChanged: (value) {
                          _checkFormValid();
                        },
                      ),
                      LabeledPasswordInputField(
                        label: "Password",
                        hint: "Enter your password",
                        maxLength: 12,
                        minLength: 4,
                        validator: Validators.required(fieldName: "Password"),
                        controller: _passwordController,
                        onChanged: (value) {
                          _checkFormValid();
                        },
                      ),
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Material(
                          color:
                              Colors.transparent, // needed for ripple to show
                          child: InkWell(
                            onTap: () {
                              print("forget password is clicked");
                            },
                            child: Text(
                              "I forgot my password",
                              style: AppTextStyles.paragraphMedium.copyWith(
                                color: AppColors.primaryBlack60,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: AppTextStyles.paragraphMedium,
                      foregroundColor: AppColors.primaryBlue100,
                    ),
                    onPressed: _onCreateAccountClick,
                    child: Text("Dont't have account? Let's create!"),
                  ),
                  SizedBox(height: AppDimensions.spacingXSmall),
                  PrimaryButton(
                    text: "Next",
                    fullWidth: true,
                    buttonSize: ButtonSize.large,
                    onTap: _isValid
                        ? () {
                            context.push(AppRoutes.auth);
                          }
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
