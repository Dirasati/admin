part of '../student_form.dart';

class _ParentForm extends StatelessWidget {
  const _ParentForm();

  @override
  Widget build(BuildContext context) {
    final dtos =
        context.read<StudentFormCubit>().dto.parentsReferences;
    return ValueListenableBuilder(
      valueListenable: dtos,
      builder: (_, parentDtos, __) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  for (var i = 0; i < parentDtos.length; i++)
                    _ParentFormCard(
                      parentDto: parentDtos[i],
                      onRemove:
                          parentDtos.length > 1
                              ? () => dtos.removeValue(parentDtos[i])
                              : null,
                    ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => dtos.addValue(ParentReferenceDTO()),
              icon: const Icon(AppIcons.add),
            ),
          ],
        );
      },
    );
  }
}

class _ParentFormCard extends StatelessWidget {
  final ParentReferenceDTO parentDto;
  final VoidCallback? onRemove;

  const _ParentFormCard({
    Key? key,
    required this.parentDto,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        AppTextField(
          controller: parentDto.parentIDController,
          label: 'ID'.tr(context),
          width: 380.w,
          isRequired: true,
          validator:
              (value) => parentDto.validateParentID(value, context),
        ),

        AppDropDownField(
          controller: parentDto.parentRelationController,
          label: 'Relationship'.tr(context),
          width: 380.w,
          isRequired: true,
          validator:
              (value) =>
                  parentDto.validateParentRelation(value, context),
          itemsBuilder: (_) => AppConstants.parentRelations,
          itemToString: (relation) => relation,
        ),

        if (onRemove != null)
          IconButton(
            onPressed: onRemove,
            icon: const Icon(AppIcons.remove),
          ),
      ],
    );
  }
}
