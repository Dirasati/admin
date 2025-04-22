import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  final List<TextInputFormatter>? inputFormatters;

  final bool isRequired;

  final double width;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,

    this.inputFormatters,
    this.isRequired = false,

    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FormField(
        validator: (_) => validator?.call(controller.text),
        builder:
            (state) => Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 2.h,
                    start: 8.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: label,
                            children: [
                              TextSpan(
                                text: isRequired ? ' *' : '',
                                style: AppTextStyles.large.copyWith(
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                          style: AppTextStyles.large.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: controller,
                  validator: validator,

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

                    error: state.hasError ? SizedBox.shrink() : null,

                    prefixIconConstraints: BoxConstraints(
                      minWidth: 8.w,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 8.w,
                    ),

                    hintStyle: AppTextStyles.medium.copyWith(
                      color: AppColors.greyDark,
                    ),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.greyDark,
                      ),
                      borderRadius: BorderRadius.circular(8).r,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                      borderRadius: BorderRadius.circular(8).r,
                    ),

                    errorBorder: OutlineInputBorder(
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
            ),
      ),
    );
  }
}
