part of '../school_classes_screen.dart';

class _ClassesList extends StatelessWidget {
  const _ClassesList();

  @override
  Widget build(BuildContext context) {
    final classes = context.select(
      (SchoolClassesCubit cubit) => cubit.classes,
    );

    final isLoading = context.select(
      (SchoolClassesCubit cubit) => cubit.isLoading,
    );
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              //loding indicator
              if (isLoading)
                LinearProgressIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.primaryLight,
                ),

              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children:
                    classes.map((class_) {
                      return _ClassCard(class_);
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClassCard extends StatelessWidget {
  final SchoolClassModel class_;
  const _ClassCard(this.class_);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryLight),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  class_.name ?? '',
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              //popup menu
              PopupMenuButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  AppIcons.more_vert,
                  color: AppColors.primary,
                  size: 32.r,
                ),

                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        onTap: () {
                          context.dialogWith<SchoolClassModel>(
                            child: BlocProvider<SchoolClassFormCubit>(
                              create:
                                  (_) =>
                                      UpdateSchoolClassCubit(class_)
                                        ..init(),
                              child: const SchoolClassForm(),
                            ),
                            onResult: (class_) {
                              context
                                  .read<SchoolClassesCubit>()
                                  .updateClass(class_);
                              context.showSuccessSnackbar(
                                'Class updated successfully',
                              );
                            },
                          );
                        },
                        child: Text(
                          'Edit'.tr(context),
                          style: AppTextStyles.normal,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.alertDialog(
                            title: 'Delete'.tr(context),
                            content: 'DeleteConfirmation'.tr(context),
                            onConfirm:
                                () => context
                                    .read<SchoolClassesCubit>()
                                    .removeClass(class_),
                          );
                        },
                        child: Text(
                          'Delete'.tr(context),
                          style: AppTextStyles.normal,
                        ),
                      ),
                    ],
              ),
            ],
          ),

          Row(
            children: [
              Text(
                'Students: ${class_.nbOfStudents}',
                style: AppTextStyles.normal,
              ),
              const Spacer(),
              Text(
                'Teachers: ${class_.nbOfTeachers}',
                style: AppTextStyles.normal,
              ),
              widthSpace(32),
            ],
          ),
        ],
      ),
    );
  }
}
