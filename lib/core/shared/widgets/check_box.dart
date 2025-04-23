import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCheckBoxField extends StatelessWidget {
  final BooleanEditingController controller;

  final String? Function(bool?)? validator;

  final String label;
  final bool isRequired;

  const AppCheckBoxField({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) => validator?.call(controller.value),
      builder:
          (state) => Row(
            spacing: 12.w,
            children: [
              Checkbox(
                value: controller.value,
                onChanged: (_) => controller.toggle(),
                activeColor: Colors.blue,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: label,
                        style: AppTextStyles.medium,
                        children: [
                          if (isRequired)
                            TextSpan(
                              text: ' *',
                              style: AppTextStyles.medium.copyWith(
                                color: Colors.red,
                              ),
                            ),
                        ],
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
            ],
          ),
    );
  }
}
