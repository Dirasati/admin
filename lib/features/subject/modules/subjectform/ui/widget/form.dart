part of '../subject_form_view.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<SubjectFormCubit>().dto;
    return Form(
      key: dto.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            controller: dto.nameController,
            label: 'SubjectName'.tr(context),
            isRequired: true,
            validator:
                (value) =>
                    value.isNullOrEmpty
                        ? 'FieldIsRequired'.tr(context)
                        : null,
          ),
          heightSpace(12),
      
          AppDropDownField(
            controller: dto.levelController,
            itemsBuilder: (_) => AppConstants.levels,
            itemToString: (level) => level.tr(context),
            label: 'Level'.tr(context),
            isRequired: true,
            validator:
                (value) =>
                    value.isNullOrEmpty ||
                            !AppConstants.levels.contains(value)
                        ? 'FieldIsRequired'.tr(context)
                        : null,
          ),
          heightSpace(12),
      
          AppDropDownField(
            controller: dto.coefficientController,
            label: 'Coefficient'.tr(context),
            itemsBuilder: (_) => [for (int i = 1; i <= 8; i++) i],
            itemToString: (coefficient) => coefficient.toString(),
            isRequired: true,
            validator:
                (value) =>
                    value == null ||
                            ![for (int i = 1; i <= 8; i++) i]
                                .contains(value)
                        ? 'FieldIsRequired'.tr(context)
                        : null,
          ),
          heightSpace(12),
      
          AppCheckBoxField(
            controller: dto.isMainController,
            label: 'IsMain'.tr(context),
            validator:
                (value) =>
                    value == null
                        ? 'FieldIsRequired'.tr(context)
                        : null,
          ),
          heightSpace(24),
      
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppButton.primary(
              text: 'Save'.tr(context),
              onPressed: context.read<SubjectFormCubit>().save,
              isLoading:
                  (ctx) => ctx.select(
                    (SubjectFormCubit cubit) =>
                        cubit.state.isLoading,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
