part of '../teachers_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeachersCubit>();
    return Row(
      children: [
        Expanded(
          child: AppSearchField(
            controller: cubit.filters.keywordController,
            onSearch: (_) => cubit.firstPage(),
          ),
        ),
        const Spacer(),
        AppButton.primary(
          text: 'AddTeacher'.tr(context),
          onPressed: () {
            context.dialogWith<TeacherModel>(
              child: BlocProvider<TeacherFormCubit>(
                create: (_) => CreateTeacherCubit(),
                child: const TeacherFormView(),
              ),
              onResult: cubit.addTeacher,
            );
          }, 
          suffixIcon: AppIcons.add,
        ),
      ],
    );
  }
}
