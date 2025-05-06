part of '../admins_screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdminsCubit>();
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
          text: 'AddAdmin'.tr(context),
          onPressed: () {
            context.dialogWith<AdminModel>(
              child: BlocProvider<AdminFormCubit>(
                create: (_) => CreateAdminCubit(),
                child: const AdminFormView(),
              ),
              onResult: cubit.addAdmin,
            );
          },
          suffixIcon: AppIcons.add,
        ),
      ],
    );
  }
}
