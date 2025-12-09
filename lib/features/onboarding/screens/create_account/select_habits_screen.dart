import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';
import 'package:habits_tracker_app/core/widgets/body_wrapper.dart';
import 'package:habits_tracker_app/core/widgets/header.dart';
import 'package:habits_tracker_app/core/widgets/models/button_size.dart';
import 'package:habits_tracker_app/core/widgets/primary_button.dart';
import 'package:habits_tracker_app/features/onboarding/screens/models/habit_ui_model.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/option_box.dart';
import 'package:habits_tracker_app/features/onboarding/widgets/single_choice_box.dart';
import 'package:habits_tracker_app/routes/app_routes.dart';

class SelectHabitsScreen extends StatefulWidget {
  SelectHabitsScreen({super.key});

  @override
  State<SelectHabitsScreen> createState() => _SelectHabitsScreenState();
}

class _SelectHabitsScreenState extends State<SelectHabitsScreen> {
  final List<HabitUiModel> habits = [
    HabitUiModel(emoji: "💧", name: "Drink water"),
    HabitUiModel(emoji: "🏃🏻‍♀️", name: "Run"),
    HabitUiModel(emoji: "📖", name: "Read books"),
    HabitUiModel(emoji: "🧘🏻‍♀️", name: "Meditate"),
    HabitUiModel(emoji: "🧑🏻‍💻‍", name: "Study"),
    HabitUiModel(emoji: "📕", name: "Journal"),
    HabitUiModel(emoji: "🌿‍", name: "Water plant"),
    HabitUiModel(emoji: "😴", name: "Sleep"),
    HabitUiModel(emoji: "🧑🏻‍💻‍", name: "Study"),
    HabitUiModel(emoji: "📕", name: "Journal"),
    HabitUiModel(emoji: "🌿‍", name: "Water plant"),
    HabitUiModel(emoji: "😴", name: "Sleep"),
  ];

  // Holds selected indexes
  final Set<int> selectedIndexes = {};

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  void _onNextTap() {
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: "Create Account", leftIcon: AppIconType.arrowLeft),
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
                    "Choose your first habits",
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.primaryBlack100,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.spacingXSmall),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "You may add more habits later",
                    style: AppTextStyles.paragraphBook.copyWith(
                      color: AppColors.primaryBlack60,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.spacingMedium,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of columns
                          crossAxisSpacing: AppDimensions.spacingLarge,
                          mainAxisSpacing: AppDimensions.spacingMedium,
                          childAspectRatio: 1.2,
                        ),
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => toggleSelection(index),
                        child: SelectableOption(
                          isSelected: selectedIndexes.contains(index),
                          child: SizedBox(
                            height: gridCellHeight,
                            child: OptionBox(
                              emoji: habits[index].emoji,
                              title: habits[index].name,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                PrimaryButton(
                  text: "Next",
                  onTap: selectedIndexes.isNotEmpty ? _onNextTap : null,
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
