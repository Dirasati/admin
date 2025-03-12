import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final TextStyle style;
  final String text;

  AppText.h1(this.text, {super.key, Color? color})
    : style = _buildTextStyle(48, FontWeight.bold, color);

  AppText.h2(this.text, {super.key, Color? color})
    : style = _buildTextStyle(36, FontWeight.bold, color);

  AppText.h3(this.text, {super.key, Color? color})
    : style = _buildTextStyle(28, FontWeight.bold, color);

  AppText.h4(this.text, {super.key, Color? color})
    : style = _buildTextStyle(24, FontWeight.w600, color);

  AppText.xLarge(this.text, {super.key, Color? color})
    : style = _buildTextStyle(22, FontWeight.w500, color);

  AppText.large(this.text, {super.key, Color? color})
    : style = _buildTextStyle(20, FontWeight.w500, color);

  AppText.medium(this.text, {super.key, Color? color})
    : style = _buildTextStyle(18, FontWeight.w400, color);

  AppText.normal(this.text, {super.key, Color? color})
    : style = _buildTextStyle(16, FontWeight.w400, color);

  AppText.small(this.text, {super.key, Color? color})
    : style = _buildTextStyle(14, FontWeight.w400, color);

  AppText.hint(this.text, {super.key, Color? color})
    : style = _buildTextStyle(12, FontWeight.w300, color);

  AppText.primaryButton(this.text, {super.key})
    : style = _buildTextStyle(16, FontWeight.w600, AppColors.white);

  AppText.secondaryButton(this.text, {super.key})
    : style = _buildTextStyle(16, FontWeight.w600, AppColors.primary);

  AppText.link(this.text, {super.key})
    : style = _buildTextStyle(
        16,
        FontWeight.w600,
        AppColors.primary,
      ).copyWith(decoration: TextDecoration.underline);

  factory AppText.error(String text) =>
      AppText.small(text, color: AppColors.error);

  @override
  Widget build(BuildContext context) => Text(text, style: style);

  static TextStyle _buildTextStyle(
    double size,
    FontWeight weight,
    Color? color,
  ) {
    return TextStyle(
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
    );
  }
}
