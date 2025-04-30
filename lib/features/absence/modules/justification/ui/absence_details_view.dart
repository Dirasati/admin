import 'package:dirasaty_admin/core/extension/date_formatter.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/justification_cubit.dart';

class AbsenceDetailsView extends StatelessWidget {
  const AbsenceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<JustificationCubit, bool>(
      (cubit) => cubit.isLoading,
    );

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      width: 800.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Justification',
            style: AppTextStyles.h4.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          heightSpace(12),
          Row(
            spacing: 16.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildStudentInfo(context)),
              Expanded(child: _buildParentInfo(context)),
            ],
          ),
          heightSpace(16),

          Text('Justification Reason', style: AppTextStyles.xLarge),
          heightSpace(4),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              context
                      .read<JustificationCubit>()
                      .absence
                      .justification!
                      .content ??
                  '',
              style: AppTextStyles.medium.copyWith(
                color: AppColors.blackLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentInfo(BuildContext context) {
    final absence = context.read<JustificationCubit>().absence;
    final student = absence.student!;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Student Information', style: AppTextStyles.xLarge),
          heightSpace(12),

          _buildInfo('Name', student.fullName),
          heightSpace(4),
          _buildInfo('Class', student.schoolClass?.name ?? ''),
          heightSpace(4),
          _buildInfo(
            'Date of Birth',
            student.birthDate?.toDayMonthYear() ?? '',
          ),
          heightSpace(4),
          _buildInfo(
            'Absence Date',
            absence.absentSince?.toDayMonthYear() ?? '',
          ),
        ],
      ),
    );
  }

  Widget _buildParentInfo(BuildContext context) {
    final absence = context.read<JustificationCubit>().absence;
    final parent = absence.justification!.parent!;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Parent Information', style: AppTextStyles.xLarge),
          heightSpace(12),

          _buildInfo('Name', parent.name),
          heightSpace(4),
          _buildInfo('Phone', parent.phone ?? ''),
          heightSpace(4),
          _buildInfo('Email', parent.email ?? ''),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String info) {
    return Row(
      spacing: 8.w,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title :',
          style: AppTextStyles.medium.copyWith(
            color: AppColors.black,
          ),
        ),
        Text(
          info,
          style: AppTextStyles.medium.copyWith(
            color: AppColors.blackLight,
          ),
        ),
      ],
    );
  }
}
