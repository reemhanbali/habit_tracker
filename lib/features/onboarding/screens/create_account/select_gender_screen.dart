import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/asset_icon.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/icon_button.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/option_box.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/single_choice_box.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

class SelectGenderScreen extends StatefulWidget {
  SelectGenderScreen({super.key});

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  int _selectedGenderIndex = -1;

  void _onGenderSelected(int index) {
    setState(() {
      _selectedGenderIndex = index;
    });
  }

  void _onNextTap() {
    context.go(AppRoutes.createAccountStep3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Create Account",
        leftIcon: AssetIcon(AppIconType.arrowLeft.assetPath),
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
                    selectedIndex: _selectedGenderIndex,
                    firstOption: SizedBox(
                      height: gridCellHeight,
                      child: OptionBox(emoji: "🤷🏻‍", title: "Male"),
                    ),
                    secondOption: SizedBox(
                      height: gridCellHeight,
                      child: OptionBox(emoji: "🙋🏻‍♀️", title: "Female"),
                    ),
                    onSelectionChanged: (value) => _onGenderSelected(value),
                  ),
                ),
                PrimaryButton(
                  text: "Next",
                  onTap: _selectedGenderIndex != -1 ? _onNextTap : null,
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
