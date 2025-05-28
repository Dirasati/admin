part of '../tuition_fee_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TuitionFeesCubit>();
    return Row(
      children: [
        Expanded(
          child: AppSearchField(
            controller: cubit.filter.keywordController,
            onSearch: (_) => cubit.firstPage(),
          ),
        ),
      ],
    );
  }
}
