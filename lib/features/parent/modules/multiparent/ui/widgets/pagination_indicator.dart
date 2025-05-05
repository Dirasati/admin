part of '../parents_screen.dart';

class _PaginationIndicator extends StatelessWidget {
  const _PaginationIndicator();

  @override
  Widget build(BuildContext context) {
    final pagination = context.select(
      (MultiParentCubit cubit) => cubit.pagination,
    );

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PaginationIndicator(
        pagination: pagination,
        onNext: context.read<MultiParentCubit>().nextPage,
        onPrev: context.read<MultiParentCubit>().prevPage,
      ),
    );
  }
}
