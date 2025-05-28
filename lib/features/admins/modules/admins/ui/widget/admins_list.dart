// This file defines the _AdminsList widget for the AdminsScreen.
part of '../admins_screen.dart';

class _AdminsList extends StatelessWidget {
  const _AdminsList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminsCubit>();

    return cubit.state.isLoading
        ? AppLoadingWidget()
        : InfoTable(
            columns: _generateColumns(context),
            items: cubit.admins,
          );
  }

  List<InfoColumn<AdminModel>> _generateColumns(BuildContext context) => [
        InfoColumn(
          flex: 8,
          header: _buildTitle("Name".tr(context)),
          itemBuilder: (admin) => Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.greyDark,
              ), 
              widthSpace(12),
              _buildInfo(admin.fullName),
            ],
          ),
        ),
        InfoColumn(
          flex: 4,
          header: _buildTitle("Email".tr(context)),
          itemBuilder: (admin) => _buildInfo(admin.email ?? ''),
        ),
        InfoColumn(
          flex: 4,
          header: _buildTitle("Phone".tr(context)),
          itemBuilder: (admin) => _buildInfo(admin.phone ?? ''),
        ),
      
        InfoColumn(
          flex: 1,
          header: SizedBox.shrink(),
          itemBuilder: (admin) => PopupMenuButton(
            icon: Icon(AppIcons.more_vert),
            itemBuilder: (context) => _buildButtons(context, admin),
          ),
        ),
      ];

  List<PopupMenuEntry<AdminModel>> _buildButtons(
    BuildContext context,
    AdminModel admin,
  ) {
    return [
      PopupMenuItem(
        onTap: () {
          context.dialogWith<AdminModel>(
            child: BlocProvider<AdminFormCubit>(
              create: (_) => UpdateAdminCubit(admin),
              child: AdminFormView(),
            ),
            onResult: context.read<AdminsCubit>().updateAdmin,
          );
        },
        child: Row(
          children: [Icon(AppIcons.edit), Text("Edit".tr(context))],
        ),
      ),
      PopupMenuItem(
        onTap: () {
          context.alertDialog(
            title: 'Delete'.tr(context),
            content: 'DeleteConfirmation'.tr(context),
            onConfirm: () {
              context.read<AdminsCubit>().deleteAdmin(admin);
              context.showSuccessSnackbar(
                'DeletedSuccessfully'.tr(context),
              );
            },
          );
        },
        child: Row(
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
