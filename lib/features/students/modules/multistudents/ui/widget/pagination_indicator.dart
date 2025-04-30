part of '../students_list_view.dart';

class _PaginationIndicator extends StatelessWidget {
  const _PaginationIndicator();

  @override
  Widget build(BuildContext context) {
    final pagination = context.select(
      (StudentsListCubit cubit) => cubit.pagination,
    );

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PaginationIndicator(
        pagination: pagination,
        onNext: context.read<StudentsListCubit>().nextPage,
        onPrev: context.read<StudentsListCubit>().prevPage,
      ),
    );
  }
}
