part of '../teachers_screen.dart';

class _TeachersList extends StatelessWidget {
  const _TeachersList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TeachersCubit>();

    return cubit.state.isLoading
        ? AppLoadingWidget()
        : InfoTable(
          columns: _generateColumns(context),
          items: cubit.teachers,
        );
  }

  List<InfoColumn<TeacherModel>> _generateColumns(
    BuildContext context,
  ) => [
    InfoColumn(
      flex: 8,
      header: _buildTitle("Name".tr(context)),
      itemBuilder:
          (teacher) => Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.greyDark,
              ),
              _buildInfo(teacher.fullName),
            ],
          ),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Email".tr(context)),
      itemBuilder: (teacher) => _buildInfo(teacher.email ?? ''),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Phone".tr(context)),
      itemBuilder: (teacher) => _buildInfo(teacher.phone ?? ''),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Subjects".tr(context)),
      itemBuilder:
          (teacher) => _buildInfo(teacher.subjects?.join(', ') ?? ''),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Address".tr(context)),
      itemBuilder: (teacher) => _buildInfo(teacher.address ?? ''),
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

  List<PopupMenuEntry<TeacherModel>> _buildButtons(
    BuildContext context,
    TeacherModel teacher,
  ) {
    return [
      PopupMenuItem(
        onTap: () {
          context.dialogWith<TeacherModel>(
            child: BlocProvider<TeacherFormCubit>(
              create: (_) => UpdateTeacherCubit(teacher),
              child: TeacherFormView(),
            ),
            onResult: context.read<TeachersCubit>().updateTeacher,
          );
        },
        child: Row(
          spacing: 8.w,
          children: [Icon(AppIcons.edit), Text("Edit".tr(context))],
        ),
      ),

      PopupMenuItem(
        onTap: () {
          context.alertDialog(
            title: 'Delete'.tr(context),
            content: 'DeleteConfirmation'.tr(context),
            onConfirm: () {
              context.read<TeachersCubit>().deleteTeacher(teacher);
              context.showSuccessSnackbar(
                'DeletedSuccessfully'.tr(context),
              );
            },
          );
        },
        child: Row(
          spacing: 8.w,
          children: [
            Icon(AppIcons.delete, color: AppColors.red),
            Text("Delete".tr(context)),
          ],
        ),
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
