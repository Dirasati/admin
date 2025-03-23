import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/parent_form_cubit.dart';

part 'widgets/parent_form.dart';

class ParentForm extends StatelessWidget {
  const ParentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoaded = context.select(
      (ParentFormState state) => state.isLoaded,
    );
    return BlocListener<ParentFormCubit, ParentFormState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
        state.onSaved((parent) {
          context.showSuccessSnackbar("ParentSaved".tr(context));
          context.back(parent);
        });
      },
      child: Container(
        width: 1250.w,
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 32.h,
        ),
        constraints: BoxConstraints(minHeight: 850.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24).r,
        ),
        child: !isLoaded ? AppLoadingWidget() : _buildForm(context),
      ),
    );
  }

  Column _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("ParentInfo".tr(context)),
            const Spacer(),
            InkWell(
              onTap: context.back,
              child: Icon(
                Icons.close,
                color: AppColors.blackLight,
                size: 24.r,
              ),
            ),
          ],
        ),
        heightSpace(24),

        _ParentsForm(),
        heightSpace(24),

        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: AppButton.primary(
            text: "Save".tr(context),
            onPressed: context.read<ParentFormCubit>().save,
            isLoading:
                (ctx) => ctx.select(
                  (ParentFormState cubit) => cubit.isLoading,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.h3.copyWith(color: AppColors.black),
    );
  }
}
