part of '../students_list_view.dart';

class _StudentsList extends StatelessWidget {
  const _StudentsList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<StudentsListCubit>();

    return cubit.state.isLoading
        ? AppLoadingWidget()
        : InfoTable(
          columns: _generateColumns(context),
          items: cubit.students,
        );
  }

  List<InfoColumn<StudentModel>> _generateColumns(
    BuildContext context,
  ) => [
    InfoColumn(
      flex: 2,
      header: _buildTitle("ID".tr(context)),
      itemBuilder: (student) => _buildInfo(student.code!),
    ),

    InfoColumn(
      flex: 8,
      header: _buildTitle("Name".tr(context)),
      itemBuilder:
          (student) => Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.greyDark,
              ),
              _buildInfo(student.fullName),
            ],
          ),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle("Gender".tr(context)),
      itemBuilder: (student) => _buildInfo(student.gender ?? ''),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle("Level".tr(context)),
      itemBuilder: (student) => _buildInfo(student.level ?? ''),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle("Inscription".tr(context)),
      itemBuilder:
          (student) => _buildInfo(
            student.inscriptionDate?.toLocal().toDayMonthYear() ?? '',
          ),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle("Birth Day".tr(context)),
      itemBuilder:
          (student) => _buildInfo(
            student.birthDate?.toLocal().toDayMonthYear() ?? '',
          ),
    ),

    InfoColumn(
      flex: 1,
      header: SizedBox.shrink(),
      itemBuilder:
          (student) => PopupMenuButton(
            icon: Icon(AppIcons.more_vert),
            itemBuilder: (context) => _buildButtons(context, student),
          ),
    ),
  ];

  List<PopupMenuEntry<StudentModel>> _buildButtons(
    BuildContext context,
    StudentModel student,
  ) {
    return [
      PopupMenuItem(
        child: Text("Edit".tr(context)),
        onTap: () {
          context.dialogWith<StudentModel>(
            child: BlocProvider<StudentFormCubit>(
              create:
                  (context) =>
                      UpdateStudentCubit(student.id!)..load(),
              child: StudentForm(),
            ),
            onResult: (student) {
              context.read<StudentsListCubit>().replaceStudent(
                student,
              );
              context.showSuccessSnackbar("StudentSaved".tr(context));
            },
          );
        },
      ),
      PopupMenuItem(
        child: Text("Delete".tr(context)),
        onTap: () {
          context.alertDialog(
            title: "Delete".tr(context),
            content: "DeleteConfirmation".tr(context),
            onConfirm:
                () => context.read<StudentsListCubit>().removeStudent(
                  student,
                ),
          );
        },
      ),
    ];
  }

  Text _buildInfo(String info) {
    return Text(
      info,
      style: AppTextStyles.medium.copyWith(color: AppColors.black),
    );
  }

  Text _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: AppTextStyles.large.copyWith(
        color: AppColors.blackLight,
      ),
    );
  }
}
