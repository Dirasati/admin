part of '../school_classes_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SchoolClassesCubit>();
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
          text: 'Add Class',
          onPressed:
              () => context.dialogWith<SchoolClassModel>(
                child: BlocProvider<SchoolClassFormCubit>(
                  create: (_) => CreateSchoolClassCubit()..init(),
                  child: const SchoolClassForm(),
                ),
                onResult: (class_) {
                  cubit.addClass(class_);
                  context.showSuccessSnackbar(
                    'Class added successfully',
                  );
                },
              ),
          suffixIcon: AppIcons.add,
        ),
      ],
    );
  }
}
