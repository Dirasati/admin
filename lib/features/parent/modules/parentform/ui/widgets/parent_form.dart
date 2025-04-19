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
          //TODO complete the form
        ],
      ),
    );
  }
}
