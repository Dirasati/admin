import 'package:dirasaty_admin/core/constants/data.dart';
import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/navigator.extension.dart';
import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/widgets/button.dart';
import 'package:dirasaty_admin/core/shared/widgets/date_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/shared/widgets/loading_widget.dart';
import 'package:dirasaty_admin/core/shared/widgets/text_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parent_refernce_dto.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parents_filter.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/logic/multi_parent_cubit.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/ui/parent_refernces.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/ui/parents_selector.dart';
import 'package:dirasaty_admin/features/students/modules/studentform/logic/student_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widget/student_form.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoaded = context.select(
      (StudentFormCubit cubit) => cubit.state.isLoaded,
    );
    return BlocListener<StudentFormCubit, StudentFormState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSaved((student) {
          context.back(student);
        });
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
        child: !isLoaded ? AppLoadingWidget() : _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final dto = context.read<StudentFormCubit>().dto;
    final parentsReferences = dto.parentsReferencesController;
    return Form(
      key: dto.formKey,
      child: SingleChildScrollView(
        child: Column(
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

            _StudentForm(),
            heightSpace(24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildTitle("Parents".tr(context))),

                InkWell(
                  onTap:
                      () => context.dialogWith<ParentModel>(
                        child: BlocProvider(
                          create:
                              (context) => MultiParentCubit(
                                ParentsFilter(limit: 3),
                              ),
                          child: ParentsSelector(),
                        ),
                        onResult: (parent) {
                          parentsReferences.addValue(
                            ParentReferenceDTO(parent),
                          );
                        },
                      ),
                  child: Icon(AppIcons.add),
                ),
              ],
            ),
            heightSpace(24),

            SizedBox(
              child: ParentRefernces(controller: parentsReferences),
            ),
            heightSpace(24),

            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AppButton.primary(
                text: "Save".tr(context),
                onPressed: context.read<StudentFormCubit>().save,
                isLoading:
                    (ctx) => ctx.select(
                      (StudentFormCubit cubit) =>
                          cubit.state.isLoading,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.h3.copyWith(color: AppColors.black),
    );
  }
}
