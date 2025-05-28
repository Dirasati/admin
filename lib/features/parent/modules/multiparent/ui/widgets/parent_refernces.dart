import 'package:dirasaty_admin/core/constants/data.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parent_refernce_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentRefernces extends StatelessWidget {
  final ListEditingController<ParentReferenceDTO> controller;
  const ParentRefernces({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        if (controller.value.isEmpty) {
          return 'ParentRequired'.tr(context);
        }
        return null;
      },
      builder:
          (state) => Column(
            children: [
              ValueListenableBuilder(
                valueListenable: controller,
                builder: (_, parentDtos, __) {
                  return Wrap(
                    spacing: 16.w,
                    runSpacing: 16.h,
                    crossAxisAlignment: WrapCrossAlignment.start,

                    children:
                        parentDtos.map((parentDto) {
                          return _buildParentCard(context, parentDto);
                        }).toList(),
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
  }

  Widget _buildParentCard(
    BuildContext contxt,
    ParentReferenceDTO parentDto,
  ) {
    final parent = parentDto.parentController.value;
    return Container(
      width: 380.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  parent?.fullName ?? 'UNDEFINED'.tr(contxt),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.xLarge,
                ),
              ),
              IconButton(
                onPressed:
                    () => contxt.alertDialog(
                      title: 'DeleteParent'.tr(contxt),
                      content: 'DeleteParentConfirmation'.tr(contxt),
                      onConfirm:
                          () => controller.removeValue(parentDto),
                    ),
                icon: Icon(
                  AppIcons.close,
                  size: 24.r,
                  color: AppColors.red,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...{
                AppIcons.phone: parent?.phone,
                AppIcons.email: parent?.email,
              }.entries.map(
                (e) => Expanded(
                  child: Row(
                    spacing: 4.w,
                    children: [
                      Icon(e.key, size: 24.r),
                  
                      Expanded(
                        child: Text(
                          e.value ?? 'UNDEFINED'.tr(contxt),
                          style: AppTextStyles.small,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          AppDropDownField(
            controller: parentDto.parentRelationController,
            hintText: 'e.g. mother, father'.tr(contxt),
            itemsBuilder: (_) => AppConstants.parentRelations,
            isRequired: true,
            itemToString: (relation) => relation.tr(contxt),
            validator: (relation) {
              if (relation == null || relation.isEmpty) {
                return 'ParentRelationRequired'.tr(contxt);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
