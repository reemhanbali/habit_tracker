import 'package:flutter/material.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/option_box.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/single_choice_box.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  int _selectedGenderIndex = -1;

  void _onGenderSelected(int index) {
    setState(() {
      _selectedGenderIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Create Account",
        leftIcon: AppIconType.arrowLeft.assetPath,
      ),
      body: BodyWrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingLarge,
            vertical: AppDimensions.spacingSmall,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: AppDimensions.spacingSmall),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "Choose your gender",
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.primaryBlack100,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.spacingMedium),
                Expanded(
                  child: SingleChoiceBox(
                    firstOption: SizedBox(
                      height: gridCellHeight,
                      child: OptionBox(emoji: "🤷🏻‍", title: "Male"),
                    ),
                    secondOption: SizedBox(
                      height: gridCellHeight,
                      child: OptionBox(emoji: "🙋🏻‍♀️", title: "Female"),
                    ),
                    onSelectionChanged: (value) => _onGenderSelected,
                  ),
                ),
                PrimaryButton(
                  text: "Next",
                  fullWidth: true,
                  buttonSize: ButtonSize.large,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
