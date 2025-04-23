part of '../teachers_screen.dart';

class _PaginationIndicator extends StatelessWidget {
  const _PaginationIndicator();

  @override
  Widget build(BuildContext context) {
    final pagination = context.select(
      (TeachersCubit cubit) => cubit.pagination,
    );

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PaginationIndicator(
        pagination: pagination,
        onNext: context.read<TeachersCubit>().nextPage,
        onPrev: context.read<TeachersCubit>().prevPage,
      ),
    );
  }
}
