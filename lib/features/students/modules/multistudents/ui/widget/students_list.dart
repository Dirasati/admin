part of '../students_list_view.dart';

class _StudentsList extends StatelessWidget {
  const _StudentsList();

  @override
  Widget build(BuildContext context) {
    final students = context.select(
      (StudentsListCubit cubit) => cubit.students,
    );
    return InfoTable(
      columns: _generateColumns(context),
      items: students,
    );
  }

  List<InfoColumn<StudentModel>> _generateColumns(
    BuildContext context,
  ) => [
    InfoColumn(
      header: _buildTitle("ID".tr(context)),
      itemBuilder: (student) => _buildInfo(student.code!),
    ),

    InfoColumn(
      flex: 6,
      header: _buildTitle("Name".tr(context)),
      itemBuilder:
          (student) => Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.greyDark,
              ),
              _buildInfo(student.name!),
            ],
          ),
    ),

    InfoColumn(
      flex: 2,
      header: _buildTitle("Gender".tr(context)),
      itemBuilder:
          (student) => _buildInfo("Male"), //TODO make it dynamic
    ),

    InfoColumn(
      flex: 2,
      header: _buildTitle("Class".tr(context)),
      itemBuilder:
          (student) => _buildInfo(student.schoolClass?.name ?? ''),
    ),

    InfoColumn(
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
          //TODO show edit student dialog
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
      style: AppTextStyles.large.copyWith(
        color: AppColors.blackLight,
      ),
    );
  }
}
