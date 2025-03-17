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
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 32.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton(
              isActivated: pagination.prev != null,
              onPressed:
                  () => context.read<StudentsListCubit>().prevPage(),
              icon: AppIcons.keyboard_arrow_left,
            ),
            widthSpace(32),
            Text(
              '${pagination.page}',
              style: AppTextStyles.xLarge.copyWith(
                color: AppColors.black,
              ),
            ),
            widthSpace(32),
            _buildButton(
              isActivated: pagination.next != null,
              onPressed:
                  () => context.read<StudentsListCubit>().nextPage(),
              icon: AppIcons.keyboard_arrow_right,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required bool isActivated,
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        icon,
        color: isActivated ? AppColors.grey : AppColors.greyDark,
        size: 24.r,
      ),
    );
  }
}
