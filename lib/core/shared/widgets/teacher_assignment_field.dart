import 'package:dirasaty_admin/core/extension/dialog.extension.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/dimensions.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/teachersubject/teaching_assignment_dto.dart';
import 'package:dirasaty_admin/core/shared/widgets/dropdown_field.dart';
import 'package:dirasaty_admin/core/themes/colors.dart';
import 'package:dirasaty_admin/core/themes/font_styles.dart';
import 'package:dirasaty_admin/core/themes/icons.dart';
import 'package:dirasaty_admin/features/subject/data/model/subject_model.dart';
import 'package:dirasaty_admin/features/subject/modules/subjectform/logic/subject_form_cubit.dart';
import 'package:dirasaty_admin/features/subject/modules/subjectform/ui/subject_form_view.dart';
import 'package:dirasaty_admin/features/teachers/modules/teachers/logic/teachers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherAssignmentField extends StatelessWidget {
  final ListEditingController<TeachingAssignmentDTO> controller;

  const TeacherAssignmentField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) {
        if (controller.value.isEmpty) {
          return 'Teacher assignment is required';
        }
        return null;
      },
      builder:
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Subjects'.tr(context),
                      style: AppTextStyles.h4,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: AppColors.primary,
                      size: 32.r,
                    ),
                    onPressed: () {
                      context.dialogWith<SubjectModel>(
                        child: BlocProvider<SubjectFormCubit>(
                          create:
                              (_) => CreateSubjectCubit()..loadDto(),
                          child: const SubjectFormView(),
                        ),
                        onResult:
                            (subject) => controller.addValue(
                              CreateTeachingAssignmentDTO(subject),
                            ),
                      );
                    },
                  ),
                ],
              ),

              ValueListenableBuilder(
                valueListenable: controller,
                builder: (_, value, __) {
                  return Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      ...value.map((assignment) {
                        return Container(
                          width: 380.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12).r,
                            border: Border.all(
                              color: AppColors.primaryLight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ValueListenableBuilder(
                                      valueListenable:
                                          assignment
                                              .subjectController,
                                      builder: (context, subject, _) {
                                        return Text(
                                          subject?.name ?? '',
                                          style: AppTextStyles.h3
                                              .copyWith(
                                                color:
                                                    AppColors
                                                        .primaryDark,
                                              ),
                                        );
                                      },
                                    ),
                                  ),

                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: AppColors.primary,
                                      size: 24.r,
                                    ),
                                    onPressed: () {
                                      context.dialogWith<
                                        SubjectModel
                                      >(
                                        child: BlocProvider<
                                          SubjectFormCubit
                                        >(
                                          create:
                                              (
                                                _,
                                              ) => UpdateSubjectCubit(
                                                assignment
                                                    .subjectController
                                                    .value!,
                                              )..loadDto(),
                                          child:
                                              const SubjectFormView(),
                                        ),
                                        onResult: (subject) {
                                          assignment.subjectController
                                              .clear();
                                          assignment.subjectController
                                              .setValue(subject);
                                        },
                                      );
                                    },
                                  ),

                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.red,
                                      size: 24.r,
                                    ),
                                    onPressed:
                                        () => controller.removeValue(
                                          assignment,
                                        ),
                                  ),
                                ],
                              ),

                              const Divider(),

                              AppDropDownField(
                                controller:
                                    assignment.teacherController,
                                itemsBuilder:
                                    (context) => context.select(
                                      (TeachersCubit cubit) =>
                                          cubit.teachers,
                                    ),
                                itemToString:
                                    (teacher) => teacher.fullName,
                                hintText: 'Select teacher'.tr(
                                  context,
                                ),
                                validator:
                                    (value) =>
                                        value == null
                                            ? 'FieldIsRequired'.tr(
                                              context,
                                            )
                                            : null,
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),

              if (state.hasError) ...[
                heightSpace(4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widthSpace(8),
                    Icon(
                      AppIcons.error_outline,
                      color: AppColors.red,
                      size: 20.r,
                    ),
                    widthSpace(8),
                    Expanded(
                      child: Text(
                        state.errorText!,
                        style: AppTextStyles.error,
                      ),
                    ),
                    widthSpace(8),
                  ],
                ),
              ],
            ],
          ),
    );
  }
}
