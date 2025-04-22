part of '../student_form.dart';

class _StudentForm extends StatelessWidget {
  const _StudentForm();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<StudentFormCubit>().dto;
    return Form(
      key: dto.formKey,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 16.w,
        runSpacing: 16.h,
        children: [
          AppTextField(
            controller: dto.firstNameController,
            label: "FirstName".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value.isValidName
                        ? "InvalidName".tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.lastNameController,
            label: "LastName".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value.isValidName
                        ? "InvalidName".tr(context)
                        : null,
          ),

          AppTextField(
            controller: dto.emailController,
            label: "Email".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value.isValidEmail
                        ? null
                        : "InvalidEmail".tr(context),
          ),

          AppTextField(
            controller: dto.codeController,
            label: "Code".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value.isNullOrEmpty
                        ? null
                        : "InvalidCode".tr(context),
          ),

          AppDropDownField(
            controller: dto.levelController,
            itemsBuilder: (_) => AppConstants.levels,
            itemToString: (level) => level.tr(context),
            label: "Level".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    AppConstants.levels.contains(value)
                        ? null
                        : "InvalidLevel".tr(context),
          ),

          AppDateField(
            controller: dto.birthDateController,
            label: "BirthDate".tr(context),
            isRequired: true,
            width: 380.w,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            validator:
                (value) =>
                    value != null
                        ? null
                        : "InvalidBirthDate".tr(context),
          ),

          AppTextField(
            controller: dto.phoneController,
            label: "Phone".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value.isValidPhoneNumber
                        ? null
                        : "InvalidPhone".tr(context),
          ),

          AppDateField(
            controller: dto.inscriptionDateController,
            label: "InscriptionDate".tr(context),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value != null
                        ? null
                        : "InvalidInscriptionDate".tr(context),
          ),

          AppDropDownField(
            controller: dto.genderController,
            label: "Gender".tr(context),
            itemsBuilder: (_) => ["Male", "Female"],
            itemToString: (value) => value.tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    ["Male", "Female"].contains(value)
                        ? null
                        : "InvalidGender".tr(context),
          ),

          AppTextField(
            controller: dto.addressController,
            label: "Address".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) =>
                    value.isNullOrEmpty
                        ? null
                        : "InvalidAddress".tr(context),
          ),
        ],
      ),
    );
  }
}
