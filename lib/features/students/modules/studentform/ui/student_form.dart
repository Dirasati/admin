import 'package:dirasaty_admin/core/constants/data.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/snackbar.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/text_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/students/data/dto/student_dto.dart';
import 'package:dirasaty_admin/features/students/modules/studentform/logic/student_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/create_student_form.dart';
part 'widget/update_student_form.dart';
part 'widget/parent_form.dart';

class StudentForm extends StatelessWidget {
  final Widget _studentForm;
  final Widget _parentForm;

  const StudentForm._({
    required Widget studentForm,
    required Widget parentForm,
  }) : _studentForm = studentForm,
       _parentForm = parentForm;

  factory StudentForm.create() {
    return StudentForm._(
      studentForm: _CreateStudentForm(),
      parentForm: _ParentForm(),
    );
  }

  factory StudentForm.update() {
    return StudentForm._(
      studentForm: _UpdateStudentForm(),
      parentForm: _ParentForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoaded = context.select(
      (StudentFormState state) => state.isLoaded,
    );
    return BlocListener<StudentFormCubit, StudentFormState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);
        state.onSaved((student) {
          context.showSuccessSnackbar("StudentSaved".tr(context));
          context.back(student);
        });
      },
      child: Container(
        width: 1250.w,
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 32.h,
        ),
        constraints: BoxConstraints(minHeight: 850.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24).r,
        ),
        child: !isLoaded ? AppLoadingWidget() : _buildForm(context),
      ),
    );
  }

  Column _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("StudentInfo".tr(context)),
            const Spacer(),
            InkWell(
              onTap: context.back,
              child: Icon(
                Icons.close,
                color: AppColors.blackLight,
                size: 24.r,
              ),
            ),
          ],
        ),
        heightSpace(24),

        _studentForm,
        heightSpace(24),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("ParentInfo".tr(context)),
            const Spacer(),
            AppButton.hyperLink(
              text: "AddParent".tr(context),
              onPressed: () {}, //TODO: Show Add Parent Dialog
            ),
          ],
        ),
        heightSpace(24),

        _parentForm,
        heightSpace(24),

        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: AppButton.primary(
            text: "Save".tr(context),
            onPressed: context.read<StudentFormCubit>().save,
            isLoading:
                (ctx) => ctx.select(
                  (StudentFormCubit cubit) => cubit.state.isLoading,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.h3.copyWith(color: AppColors.black),
    );
  }
}
