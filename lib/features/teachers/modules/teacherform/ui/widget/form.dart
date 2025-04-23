part of '../teacher_form_view.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<TeacherFormCubit>().dto;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TeacherInfo'.tr(context),
          style: AppTextStyles.h3.copyWith(color: AppColors.black),
        ),
        heightSpace(24),

        Form(
          key: dto.formKey,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 16.w,
            runSpacing: 16.h,
            children: [
              AppTextField(
                controller: dto.firstNameController,
                label: 'FirstName'.tr(context),
                isRequired: true,
                width: 380.w,
                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),

              AppTextField(
                controller: dto.lastNameController,
                label: 'LastName'.tr(context),
                isRequired: true,
                width: 380.w,

                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),

              AppTextField(
                controller: dto.emailController,
                label: 'Email'.tr(context),
                isRequired: true,
                width: 380.w,
                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),

              

              AppTextField(
                controller: dto.phoneController,
                label: 'Phone'.tr(context),
                isRequired: true,
                width: 380.w,
                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),

              AppTextField(
                controller: dto.addressController,
                label: 'Address'.tr(context),
                isRequired: true,
                width: 380.w,
                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),

              AppDropDownField(
                controller: dto.genderController,
                label: 'Gender',
                itemsBuilder: (_) => AppConstants.genders,
                itemToString: (value) => value.tr(context),
                isRequired: true,
                width: 380.w,
                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),

              AppMultiDropdownField(
                controller: dto.subjectsController,
                itemsBuilder: (_) => AppConstants.subjects,
                label: 'Subjects'.tr(context),
                itemToString: (value) => value.tr(context),
                isRequired: true,
                width: 380.w,
                validator:
                    (value) =>
                        value.isNullOrEmpty
                            ? 'FieldIsRequired'.tr(context)
                            : null,
              ),
            ],
          ),
        ),

        heightSpace(24),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: AppButton.primary(
            text: 'Save'.tr(context),
            onPressed: () => context.read<TeacherFormCubit>().save(),
            isLoading:
                (context) => context.select(
                  (TeacherFormCubit cubit) => cubit.state.isLoading,
                ),
          ),
        ),
      ],
    );
  }
}
