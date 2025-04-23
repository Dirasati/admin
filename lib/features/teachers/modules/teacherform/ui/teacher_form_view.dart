import 'package:dirasaty_admin/core/constants/data.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/list.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/check_box.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/multi_dropdown_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/text_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/teacher_form_cubit.dart';

part 'widget/form.dart';

class TeacherFormView extends StatelessWidget {
  const TeacherFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (TeacherFormCubit cubit) => !cubit.state.isLoaded,
    );
    return BlocListener<TeacherFormCubit, TeacherFormState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSaved(context.back);
      },
      child: Container(
        width: 1250.w,
        constraints: BoxConstraints(maxHeight: 1200.h),
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 32.h,
        ),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24).r,
        ),
        child: isLoading ? const AppLoadingWidget() : const _Form(),
      ),
    );
  }
}
