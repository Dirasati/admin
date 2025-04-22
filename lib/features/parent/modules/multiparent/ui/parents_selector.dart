import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/search_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/logic/multi_parent_cubit.dart';
import 'package:dirasaty_admin/features/parent/modules/parentform/logic/parent_form_cubit.dart';
import 'package:dirasaty_admin/features/parent/modules/parentform/ui/parent_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentsSelector extends StatelessWidget {
  const ParentsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MultiParentCubit>();

    return Container(
      width: 380.w,
      padding: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: AppColors.greyDark),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.h,
        children: [
          AppSearchField(
            controller: cubit.filter.keywordController,
            onSearch: (_) => cubit.firstPage(),
          ),

          _ParentsList(),

          AppButton.hyperLink(
            text: 'AddNew'.tr(context),
            onPressed: () {
              context.dialogWith<ParentModel>(
                child: BlocProvider<ParentFormCubit>(
                  create: (context) => CreateParentCubit()..loadDto(),
                  child: ParentForm(),
                ),
                onResult: cubit.add,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ParentsList extends StatelessWidget {
  const _ParentsList();

  @override
  Widget build(BuildContext context) {
    final parents = context.watch<MultiParentCubit>().parents;

    final isLoading =
        context.read<MultiParentCubit>().state.isLoading;

    return Column(
      spacing: 12.h,
      children: [
        if (isLoading) AppLoadingWidget(),
        for (final parent in parents)
          InkWell(
            onTap: () => context.back(parent),
            child: _buildParentItem(parent),
          ),
      ],
    );
  }

  Widget _buildParentItem(ParentModel parent) {
    return Container(
      padding: EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: Colors.white,
        border: Border.all(color: AppColors.greyDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            parent.name,
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),

          heightSpace(12),

          Row(
            children: [
              Expanded(
                child: _buildIconInf(AppIcons.phone, parent.phone),
              ),
              Expanded(
                child: _buildIconInf(AppIcons.email, parent.email),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconInf(IconData icon, String? info) {
    return Row(
      children: [
        Icon(icon, color: AppColors.blackLight, size: 24.r),
        widthSpace(4),
        Expanded(
          child: Text(
            info ?? '',
            style: AppTextStyles.small.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
