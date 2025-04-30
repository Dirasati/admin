import 'package:dirasaty_admin/core/extension/date_formatter.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDateField extends StatelessWidget {
  final EditingController<DateTime> controller;
  final String label;

  final DateTime firstDate;
  final DateTime lastDate;

  final String? Function(DateTime?)? validator;

  final bool isRequired;

  final double? width;

  const AppDateField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    required this.firstDate,
    required this.lastDate,
    this.isRequired = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      validator: (value) => validator?.call(controller.value),
      builder: (state) {
        return SizedBox(
          width: width,
          child: Column(
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
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
          
              ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return TextField(
                    readOnly: true,
          
                    controller: TextEditingController(
                      text: value?.toDayMonthYear() ?? '',
                    ),
          
                    style: AppTextStyles.medium.copyWith(
                      color:
                          state.hasError
                              ? AppColors.red
                              : controller.value != null
                              ? AppColors.black
                              : AppColors.greyDark,
                    ),
          
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: controller.value,
                        firstDate: firstDate,
                        lastDate: lastDate,
                      );
          
                      if (date != null) controller.setValue(date);
                    },
          
                    decoration: InputDecoration(
                      hintText: 'dd/mm/yyyy',
          
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
          
                      suffix: Icon(Icons.calendar_month_outlined),
          
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyDark,
                        ),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
          
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
          
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.red),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                    ),
                  );
                },
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
        );
      },
    );
  }
}
