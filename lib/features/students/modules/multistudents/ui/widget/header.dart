part of '../students_list_view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StudentsListCubit>();
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
          text: 'Add Student',
          onPressed: () {}, //TODO Show add student form
          suffixIcon: AppIcons.add,
        ),
        widthSpace(12),
        AppButton.secondary(
          text: 'Filter',
          onPressed: () {}, //TODO Show filter form
          suffixIcon: AppIcons.filter_list,
        ),
      ],
    );
  }
}
