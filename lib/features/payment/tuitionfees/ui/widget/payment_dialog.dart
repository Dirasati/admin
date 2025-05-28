import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/text_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/payment/data/dto/payment_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDialog extends StatefulWidget {
  final PaymentDto _paymentDto;
  final List<ParentModel> parents;

  PaymentDialog({super.key, required this.parents})
    : _paymentDto = PaymentDto();

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  @override
  initState() {
    if (widget.parents.isNotEmpty) {
      widget._paymentDto.parentController.setValue(
        widget.parents.first,
      );
    }

    widget._paymentDto.amountController.text = '0';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      constraints: BoxConstraints(maxHeight: 800.h),
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24).r,
      ),

      child: SingleChildScrollView(
        child: Form(
          key: widget._paymentDto.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                'Payment'.tr(context),
                style: AppTextStyles.xLarge.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              heightSpace(16),

              ...widget.parents.map(
                (parent) => _buildParentItem(parent),
              ),

              SizedBox(height: 24.h),
              // Amount Field
              AppTextField(
                controller: widget._paymentDto.amountController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                label: 'Amount'.tr(context),
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'AmountRequired'.tr(context);
                  }

                  return null;
                },
              ),

              heightSpace(24),

              // actions buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton.secondary(
                    onPressed: context.back,
                    text: 'Cancel'.tr(context),
                  ),
                  widthSpace(16),
                  AppButton.primary(
                    onPressed: () {
                      if (widget._paymentDto.formKey.currentState!
                          .validate()) {
                        context.back(widget._paymentDto);
                      }
                    },
                    text: 'Pay'.tr(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParentItem(ParentModel parent) {
    return ValueListenableBuilder(
      valueListenable: widget._paymentDto.parentController,
      builder: (context, value, _) {
        final isSelected = value == parent;

        return InkWell(
          onTap: () {
            widget._paymentDto.parentController.setValue(parent);
          },
          child: Container(
            padding: EdgeInsets.all(8).r,
            margin:
                EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              color:
                  isSelected
                      ? AppColors.primaryLight
                      : AppColors.white,
              border: Border.all(
                color:
                    isSelected
                        ? AppColors.primary
                        : AppColors.greyLight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parent.fullName,
                  style: AppTextStyles.xLarge.copyWith(
                    color: AppColors.black,
                  ),
                ),

                heightSpace(12),

                Row(
                  children: [
                    Expanded(
                      child: _buildIconInf(
                        AppIcons.phone,
                        parent.phone,
                      ),
                    ),
                    Expanded(
                      child: _buildIconInf(
                        AppIcons.email,
                        parent.email,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconInf(IconData icon, String? info) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greyDark),
        widthSpace(8),
        Expanded(
          child: Text(
            info ?? '-',
            style: AppTextStyles.medium.copyWith(
              color: AppColors.greyDark,
            ),
          ),
        ),
      ],
    );
  }
}
