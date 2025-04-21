part of '../school_class_form.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SchoolClassFormCubit>().dto;

    return Column(
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

        AppTextField(
          controller: dto.nameController,
          label: 'Name',
          isRequired: true,
          validator:
              (value) =>
                  value?.isEmpty == true ? 'Name is required' : null,
        ),

        AppDropDownField(
          controller: dto.levelController,
          itemsBuilder: (context) => AppConstants.levels,
          itemToString: (level) => level,
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
    );
  }
}
