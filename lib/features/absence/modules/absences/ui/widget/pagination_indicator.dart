part of '../absences_screen.dart';

class _PaginationIndicator extends StatelessWidget {
  const _PaginationIndicator();

  @override
  Widget build(BuildContext context) {
    final pagination = context.select(
      (AbsencesCubit cubit) => cubit.pagination,
    );

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PaginationIndicator(
        pagination: pagination,
        onNext: context.read<AbsencesCubit>().nextPage,
        onPrev: context.read<AbsencesCubit>().previousPage,
      ),
    );
  }
}
