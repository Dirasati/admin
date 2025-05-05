part of '../parents_screen.dart';

class _ParentsList extends StatelessWidget {
  const _ParentsList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MultiParentCubit>();

    return cubit.state.isLoading
        ? AppLoadingWidget()
        : InfoTable(
          columns: _generateColumns(context),
          items: cubit.parents,
        );
  }

  List<InfoColumn<ParentModel>> _generateColumns(
    BuildContext context,
  ) => [
    InfoColumn(
      flex: 8,
      header: _buildTitle("Name".tr(context)),
      itemBuilder:
          (parent) => Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.greyDark,
              ),
              _buildInfo(parent.fullName),
            ],
          ),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Email".tr(context)),
      itemBuilder: (parent) => _buildInfo(parent.email ?? ''),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Phone".tr(context)),
      itemBuilder: (parent) => _buildInfo(parent.phone ?? ''),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle("Address".tr(context)),
      itemBuilder: (parent) => _buildInfo(parent.address ?? ''),
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

  List<PopupMenuEntry<ParentModel>> _buildButtons(
    BuildContext context,
    ParentModel parent,
  ) {
    return [
      PopupMenuItem(
        onTap: () {
          context.dialogWith<ParentModel>(
            child: BlocProvider<ParentFormCubit>(
              create: (_) => UpdateParentCubit(parent.id!),
              child: ParentForm(),
            ),
            onResult: context.read<MultiParentCubit>().replace,
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
              context.read<MultiParentCubit>().remove(parent);
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
