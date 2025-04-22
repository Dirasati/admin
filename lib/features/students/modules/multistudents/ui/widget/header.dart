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
          onPressed:
              () => context.dialogWith<StudentModel>(
                child: BlocProvider<StudentFormCubit>(
                  create: (context) => CreateStudentCubit()..load(),
                  child: StudentForm(),
                ),
                onResult: (student) {
                  cubit.addStudent(student);
                  context.showSuccessSnackbar(
                    'Student added successfully',
                  );
                },
              ),
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
