import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/popup_selector.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/logic/multi_parent_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentsSelector extends StatelessWidget {
  const ParentsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupSelector<ParentModel>(
      widget: Icon(AppIcons.add),
      itemsBuilder: (ctx) => [],
      itemToWidget: _buildParentItem,
      onItemSelected: (parent) {
        print('Selected parent: $parent');
      },
      searchController:
          context.read<MultiParentCubit>().filter.keywordController,
      onSearch: (_) => context.read<MultiParentCubit>().firstPage(),
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
            '${parent.name}',
            style: AppTextStyles.xLarge.copyWith(
              color: AppColors.black,
            ),
          ),

          heightSpace(12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconInf(AppIcons.phone, parent.phone),
              _buildIconInf(AppIcons.email, parent.email),
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
        Text(
          info ?? '',
          style: AppTextStyles.small.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
