part of '../student_form.dart';

class _CreateStudentForm extends StatelessWidget {
  const _CreateStudentForm();

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
            controller: dto.nameController,
            label: "FullName".tr(context),
            isRequired: true,
            width: 380.w,
            validator: (value) => dto.validateName(value, context),
          ),

          AppTextField(
            controller: dto.emailController,
            label: "Email".tr(context),
            isRequired: true,
            width: 380.w,
            validator: (value) => dto.validateEmail(value, context),
          ),

          AppTextField(
            controller: dto.passwordController,
            label: "Password".tr(context),
            isRequired: true,
            width: 380.w,
            validator:
                (value) => dto.validatePassword(value, context),
          ),

          AppTextField(
            controller: dto.codeController,
            label: "Code".tr(context),
            isRequired: true,
            width: 380.w,
            validator: (value) => dto.validateCode(value, context),
          ),

          AppDropDownField(
            controller: dto.levelController,
            label: "Level".tr(context),
            isRequired: true,
            width: 380.w,
            validator: (value) => dto.validateLevel(value, context),
            itemsBuilder: (_) => AppConstants.levels,
            itemToString: (level) => level,
          ),
        ],
      ),
    );
  }
}
