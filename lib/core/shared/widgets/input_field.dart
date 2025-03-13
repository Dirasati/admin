import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/app_text.dart';
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

  final bool obscureText;

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
      builder:
          (state) => Column(
            children: [
              TextField(
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obscureText,

                style: AppTextStyles.medium.copyWith(
                  color: AppColors.black,
                ),

                cursorColor: AppColors.primary,

                inputFormatters: inputFormatters,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 8.w,
                  ),

                  hintText: hintText,
                  prefixIcon: Icon(
                    prefixIcon,
                    color: AppColors.greyDark,
                    size: 24.sp,
                  ),
                  suffixIcon: suffixIcon,

                  hintStyle: AppTextStyles.medium.copyWith(
                    color: AppColors.greyDark,
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
                    SizedBox(
                      height: 20.r,
                      width: 20.r,
                      child: Icon(
                        AppIcons.error_outline,
                        color: AppColors.red,
                      ),
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
          ),
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
      prefixIcon: AppIcons.lock,

      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? AppIcons.visibility_off : AppIcons.visibility,
          color: AppColors.greyDark,
        ),
        onPressed: () => setState(() => obscureText = !obscureText),
      ),
    );
  }
}
