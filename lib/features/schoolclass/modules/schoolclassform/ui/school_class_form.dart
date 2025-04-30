import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dirasaty_admin/core/constants/data.dart';
import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:dirasaty_admin/core/services/filepicker/file_picker_service.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/file_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/teacher_assignment_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/text_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/features/schoolclass/modules/schoolclassform/logic/school_class_form_cubit.dart';
import 'package:dirasaty_admin/features/teachers/modules/teachers/logic/teachers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/form.dart';

class SchoolClassForm extends StatelessWidget {
  const SchoolClassForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (SchoolClassFormCubit cubit) =>
          cubit.isLoading && !cubit.isLoaded,
    );

    return BlocListener<SchoolClassFormCubit, SchoolClassFormState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSaved(context.back);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        width: 1250.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: ConditionalBuilder(
          condition: isLoading,
          builder: (context) => AppLoadingWidget(),
          fallback: (context) => const _Form(),
        ),
      ),
    );
  }
}
