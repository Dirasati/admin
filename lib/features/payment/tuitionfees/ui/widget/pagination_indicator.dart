part of '../tuition_fee_screen.dart';

class _PaginationIndicator extends StatelessWidget {
  const _PaginationIndicator();

  @override
  Widget build(BuildContext context) {
    final pagination = context.select(
      (TuitionFeesCubit cubit) => cubit.pagination,
    );

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PaginationIndicator(
        pagination: pagination,
        onNext: context.read<TuitionFeesCubit>().nextPage,
        onPrev: context.read<TuitionFeesCubit>().previousPage,
      ),
    );
  }
}