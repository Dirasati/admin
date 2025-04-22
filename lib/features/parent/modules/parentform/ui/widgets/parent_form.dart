part of '../parent_form.dart';

class _ParentsForm extends StatelessWidget {
  const _ParentsForm();

  @override
  Widget build(BuildContext context) {
    final dto = context.select((ParentFormCubit cubit) => cubit.dto);
    return Form(
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
                    value?.isEmpty == true
                        ? 'FirstNameRequired'.tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.lastNameController,
            label: 'LastName'.tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value?.isEmpty == true
                        ? 'LastNameRequired'.tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.emailController,
            label: 'Email'.tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value?.isEmpty == true
                        ? 'EmailRequired'.tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.passwordController,
            label: 'Password'.tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value?.isEmpty == true
                        ? 'PasswordRequired'.tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.phoneController,
            label: 'Phone'.tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value?.isEmpty == true
                        ? 'PhoneRequired'.tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.addressController,
            label: 'Address'.tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value?.isEmpty == true
                        ? 'AddressRequired'.tr(context)
                        : null,
          ),

          AppDropDownField(
            controller: dto.genderController,
            itemsBuilder: (_) => ['Male', 'Female'],
            itemToString: (item) => item.tr(context),
            label: 'Gender'.tr(context),
            width: 380.w,
            validator:
                (p0) =>
                    p0 == null ? 'GenderRequired'.tr(context) : null,
          ),
        ],
      ),
    );
  }
}
