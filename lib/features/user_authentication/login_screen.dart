import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/labeled_text_input.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBaseWhite,
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
                  child: Column(
                    spacing: AppDimensions.spacingMedium,
                    children: [
                      LabeledTextInput(
                        label: "E_Mail",
                        hint: "Enter your email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),
                      LabeledTextInput(
                        label: "Password",
                        hint: "Enter your password",
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
                    onPressed: () {},
                    child: Text("Dont't have account? Let's create!"),
                  ),
                  PrimaryButton(
                    text: "Next",
                    fullWidth: true,
                    buttonSize: ButtonSize.large,
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
