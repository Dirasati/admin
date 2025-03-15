import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  final IconData prefixIcon;
  final Widget? suffixIcon;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final List<String>? autofillHints;

  final bool obscureText;

  final Color fillColor;

  const AppInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
    this.keyboardType,
    this.autofillHints,
    this.fillColor = AppColors.greyLight,
  });

  static Widget password({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?)? validator,
  }) => _PasswordFormField(
    controller: controller,
    hintText: hintText,
    validator: validator,
  );

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) => validator?.call(controller.text),
      autovalidateMode: AutovalidateMode.onUnfocus,
      builder: (state) {
        return Column(
          children: [
            TextField(
              controller: controller,
              obscureText: obscureText,

              keyboardType: keyboardType,
              autofillHints: autofillHints,

              style: AppTextStyles.medium.copyWith(
                color: AppColors.black,
              ),

              cursorColor: AppColors.primary,

              inputFormatters: inputFormatters,

              decoration: InputDecoration(
                fillColor: fillColor,
                filled: true,

                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 8.w,
                ),

                hintText: hintText,

                error: state.hasError ? SizedBox.shrink() : null,

                // error: SizedBox(),
                prefixIcon: Icon(
                  prefixIcon,
                  color: AppColors.greyDark,
                  size: 24.r, // Adjust icon size if necessary
                ),
                suffixIcon: suffixIcon,

                hintStyle: AppTextStyles.medium.copyWith(
                  color: AppColors.grey,
                ),

                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyDark),
                  borderRadius: BorderRadius.circular(8).r,
                ),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greyDark),
                  borderRadius: BorderRadius.circular(8).r,
                ),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(8).r,
                ),

                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                  borderRadius: BorderRadius.circular(8).r,
                ),
              ),
            ),

            if (state.hasError) ...[
              heightSpace(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widthSpace(8),
                  Icon(
                    AppIcons.error_outline,
                    color: AppColors.red,
                    size: 20.r,
                  ),
                  widthSpace(8),
                  Expanded(
                    child: Text(
                      state.errorText!,
                      style: AppTextStyles.error,
                    ),
                  ),
                  widthSpace(8),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}

class _PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const _PasswordFormField({
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<_PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      controller: widget.controller,
      hintText: widget.hintText,
      validator: widget.validator,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.password],
      prefixIcon: AppIcons.lock,

      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? AppIcons.visibility_off : AppIcons.visibility,
          color: AppColors.greyDark,
          size: 22.r,
        ),
        onPressed: () => setState(() => obscureText = !obscureText),
      ),
    );
  }
}
