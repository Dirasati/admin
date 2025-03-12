import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle h1 = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle xLarge = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle large = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle normal = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle small = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle hint = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle primaryButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle secondaryButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle link = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );

  static TextStyle error = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.red,
  );
}
