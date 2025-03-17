import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/logo.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/students/config/student_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

part 'widgets/sidebar.dart';
part 'widgets/header.dart';

class HomeScreen extends StatelessWidget {
  final Widget body;
  const HomeScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: Row(
        children: [
          _SideBar(),

          widthSpace(24),

          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 16.h,
                bottom: 22.h,
              ),
              child: Column(
                children: [
                  _Header(),

                  heightSpace(40),

                  Expanded(child: body),
                ],
              ),
            ),
          ),
          widthSpace(20),
        ],
      ),
    );
  }
}
