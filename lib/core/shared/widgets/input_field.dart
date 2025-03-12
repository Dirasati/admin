import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/app_text.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  final Widget prefixIcon;
  final Widget? suffixIcon;

  final List<TextInputFormatter>? inputFormatters;

  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
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
              TextFormField(
                controller: controller,
                validator: validator,
                obscureText: obscureText,

                style: AppTextStyles.medium.copyWith(
                  color:
                      state.hasError
                          ? AppColors.red
                          : AppColors.black,
                ),

                cursorColor: AppColors.primary,

                inputFormatters: inputFormatters,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 12.w,
                  ),

                  hintText: hintText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,

                  error: SizedBox.shrink(),

                  prefixIconConstraints: BoxConstraints(
                    minWidth: 8.w,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minWidth: 8.w,
                  ),

                  hintStyle: AppTextStyles.medium.copyWith(
                    color: AppColors.greyDark,
                  ),

                  border: UnderlineInputBorder(
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
    return InputField(
      controller: widget.controller,
      hintText: widget.hintText,
      validator: widget.validator,
      obscureText: obscureText,
      prefixIcon: Icon(AppIcons.lock, color: AppColors.black),
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
