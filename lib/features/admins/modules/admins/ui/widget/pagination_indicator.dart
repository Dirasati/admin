// This file defines the _PaginationIndicator widget for the AdminsScreen.
part of '../admins_screen.dart';

class _PaginationIndicator extends StatelessWidget {
  const _PaginationIndicator();

  @override
  Widget build(BuildContext context) {
    final pagination = context.select(
      (AdminsCubit cubit) => cubit.pagination,
    );

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: PaginationIndicator(
        pagination: pagination,
        onNext: context.read<AdminsCubit>().nextPage,
        onPrev: context.read<AdminsCubit>().prevPage,
      ),
    );
  }
}
