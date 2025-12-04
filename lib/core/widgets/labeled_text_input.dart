import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habits_tracker_app/core/theme/app_colors.dart';
import 'package:habits_tracker_app/core/theme/app_dimensions.dart';
import 'package:habits_tracker_app/core/theme/app_icon_type.dart';
import 'package:habits_tracker_app/core/theme/app_text_styles.dart';

class LabeledTextInput extends StatefulWidget {
  final String label;
  final String? hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool isEnabled;

  const LabeledTextInput({
    super.key,
    required this.label,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.isEnabled = true,
  });

  @override
  State<LabeledTextInput> createState() => _LabeledTextInputState();
}

class _LabeledTextInputState extends State<LabeledTextInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isValid = false; // validation state

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {}); // Refresh UI when text changes
    });

    _focusNode.addListener(() {
      setState(() {
        // _hasFocus = _focusNode.hasFocus;
      }); // rebuild to reflect focus change
    });
  }

  void _validate() {
    if (widget.validator != null) {
      final result = widget.validator!(_controller.text);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasFocus = _focusNode.hasFocus;

    return Opacity(
      opacity: widget.isEnabled ? _enabledAlpha : _disabledAlpha,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label.toUpperCase(), // always visible label
            style: AppTextStyles.chip.copyWith(
              color: AppColors.primaryBlack100,
            ),
          ),
          SizedBox(height: AppDimensions.spacingSmall),
          TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            enabled: widget.isEnabled,
            validator: widget.validator,
            onChanged: (value) {
              if (widget.onChanged != null) widget.onChanged!(value);
              //_validate();
              //setState(() {}); // update border color dynamically
            },
            decoration: InputDecoration(
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: SvgPicture.asset(AppIconType.clear.assetPath),
                      iconSize: AppDimensions.spacingLarge,
                      onPressed: () {
                        _controller.clear();
                        setState(() {}); // Hide the icon
                      },
                    )
                  : null,
              hintStyle: AppTextStyles.title.copyWith(
                color: hasFocus
                    ? AppColors.primaryBlack100
                    : AppColors.primaryBlack20,
              ),
              hintText: widget.hint,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryBlack20,
                  width: 1,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryBlack20,
                  width: 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: _isValid
                      ? AppColors.primaryGreenSuccess100
                      : AppColors.primaryBlue60,
                  width: 2,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryBlack20),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryRedError100,
                  width: 2,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryRedError100,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppDimensions.spacingSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const double _disabledAlpha = 0.48;
  static const double _enabledAlpha = 1;
}
