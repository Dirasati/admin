part of '../student_form.dart';

class _UpdateStudentForm extends StatelessWidget {
  const _UpdateStudentForm();

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
        ],
      ),
    );
  }
}
