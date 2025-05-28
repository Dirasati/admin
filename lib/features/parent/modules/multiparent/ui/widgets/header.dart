part of '../parents_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MultiParentCubit>();
    return Row(
      children: [
        Expanded(
          child: AppSearchField(
            controller: cubit.filter.keywordController,
            onSearch: (_) => cubit.firstPage(),
          ),
        ),
        const Spacer(),
        AppButton.primary(
          text: 'Add Parent'.tr(context),
          onPressed: () {
            context.dialogWith<ParentModel>(
              child: BlocProvider<ParentFormCubit>(
                create: (_) => CreateParentCubit()..loadDto(),
                child: const ParentForm(),
              ),
              onResult: cubit.add,
            );
          }, 
          suffixIcon: AppIcons.add,
        ),
      ],
    );
  }
}
