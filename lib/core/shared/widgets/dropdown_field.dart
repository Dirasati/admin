import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDownField<T> extends StatelessWidget {
  final EditingController<T> controller;

  final String? label;
  final String? hintText;

  final List<T> Function(BuildContext context) itemsBuilder;
  final Widget Function(T)? itemToWidget;

  final String Function(T) itemToString;
  final String? Function(T?)? validator;
  final VoidCallback? onAdd;

  final bool isRequired;

  final double width;

  const AppDropDownField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.validator,
    this.onAdd,
    this.isRequired = false,
    required this.itemsBuilder,
    required this.itemToString,
    this.itemToWidget,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final items = itemsBuilder(context);
    return SizedBox(
      width: width,
      child: FormField<T>(
        validator: (value) => validator?.call(controller.value),
        autovalidateMode: AutovalidateMode.onUnfocus,
        builder: (state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 2.h,
                  start: 8.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child:
                          label != null
                              ? Text.rich(
                                TextSpan(
                                  text: label,
                                  children: [
                                    TextSpan(
                                      text: isRequired ? ' *' : '',
                                      style: AppTextStyles.large
                                          .copyWith(
                                            color: AppColors.red,
                                          ),
                                    ),
                                  ],
                                ),
                                style: AppTextStyles.large.copyWith(
                                  color: AppColors.black,
                                ),
                              )
                              : SizedBox.shrink(),
                    ),

                    if (onAdd != null) ...[
                      InkWell(
                        // Add button
                        onTap: onAdd,
                        child: Icon(
                          AppIcons.add_circle_outline,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              DropdownSearch<T>(
                itemAsString: itemToString,
                selectedItem: controller.value,
                compareFn: (item1, item2) => item1 == item2,

                items: (filter, loadProps) => items,

                onChanged:
                    (value) =>
                        value != null
                            ? controller.setValue(value)
                            : controller.clear(),

                decoratorProps: DropDownDecoratorProps(
                  baseStyle: AppTextStyles.medium.copyWith(
                    color: AppColors.black,
                  ),

                  decoration: InputDecoration(
                    hintText: hintText,
                    error: state.hasError ? SizedBox.shrink() : null,

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12).r,
                      borderSide: BorderSide(color: AppColors.grey),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12).r,
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12).r,
                      borderSide: BorderSide(color: AppColors.red),
                    ),
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
      ),
    );
  }
}
