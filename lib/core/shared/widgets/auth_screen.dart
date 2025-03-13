import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/logo.dart';
import 'package:dirasaty_admin/core/themes/app_text.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  final String title;
  final String message;

  final Widget form;

  final AppButton submitButton;

  const AuthScreen({
    super.key,
    required this.title,
    required this.message,
    required this.form,
    required this.submitButton,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyLight,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 275.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.w,
                  vertical: 45.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16).r,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.h1.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      heightSpace(24),
                      Text(
                        message,
                        style: AppTextStyles.medium.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      heightSpace(52),
                      form,
                      heightSpace(52),
                      submitButton,
                    ],
                  ),
                ),
              ),
            ),

            PositionedDirectional(
              top: 40.h,
              start: 40.w,
              child: AppLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
