import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      child: LinearProgressIndicator(
        backgroundColor: AppColors.greyLight,
        valueColor: AlwaysStoppedAnimation(AppColors.primary),
        borderRadius: BorderRadius.circular(8).r,
      ),
    );
  }
}
