part of '../school_class_form.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SchoolClassFormCubit>().dto;

    return Form(
      key: dto.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'School Class Form',
                    style: AppTextStyles.h4,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: context.back,
                ),
              ],
            ),

            Row(
              spacing: 16.w,
              children: [
                AppTextField(
                  controller: dto.nameController,
                  label: 'Name',
                  isRequired: true,
                  width: 380.w,
                  validator:
                      (value) =>
                          value?.isEmpty == true
                              ? 'Name is required'
                              : null,
                ),

                AppDropDownField(
                  controller: dto.levelController,
                  itemsBuilder: (context) => AppConstants.levels,
                  itemToString: (level) => level.tr(context),
                  label: 'Level'.tr(context),
                  isRequired: true,
                  width: 380.w,
                  validator:
                      (value) =>
                          value.isNullOrEmpty
                              ? 'Level is required'
                              : null,
                ),
              ],
            ),

            BlocProvider(
              create:
                  (context) =>
                      TeachersCubit()
                        ..filters.limit.setValue(120)
                        ..getTeachers(),
              child: TeacherAssignmentField(
                controller: dto.teachingAssignments,
              ),
            ),

            AppFileField(
              controller: dto.planingController,
              filePickerService: locator<PdfPickerService>(),
              uploadText: 'Upload Planing'.tr(context),
              label: 'Planing'.tr(context),
              height: 550.h,
              width: double.infinity,
              borderRadius: 16.r,
              isRequired: false,
            ),

            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AppButton.primary(
                text: 'Save',
                onPressed: context.read<SchoolClassFormCubit>().save,
                isLoading:
                    (context) => context.select(
                      (SchoolClassFormCubit cubit) => cubit.isLoading,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
