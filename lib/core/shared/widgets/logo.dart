import 'package:dirasaty_admin/core/themes/app_text.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.w,
      children: [
        SizedBox(
          height: 64.h,
          width: 64.w,
          child: Icon(AppIcons.school, color: AppColors.primary),
        ),
        Text(
          'Dirasaty',
          style: AppTextStyles.h3.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
