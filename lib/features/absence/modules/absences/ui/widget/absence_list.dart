part of '../absences_screen.dart';

class _AbsencesList extends StatelessWidget {
  const _AbsencesList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AbsencesCubit>();

    return cubit.isLoading
        ? AppLoadingWidget()
        : InfoTable(
          columns: _generateColumns(context),
          items: cubit.absence,
        );
  }

  List<InfoColumn<AbsenceModel>> _generateColumns(
    BuildContext context,
  ) => [
    InfoColumn(
      flex: 6,
      header: _buildTitle('Student Name'.tr(context)),
      itemBuilder:
          (absence) => _buildInfo(absence.student?.fullName ?? ''),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle('Subject'.tr(context)),
      itemBuilder: (absence) => _buildInfo(absence.subjectName ?? ''),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle('Absence Since'.tr(context)),
      itemBuilder:
          (absence) =>
              _buildInfo(absence.absentSince?.toDayMonthYear() ?? ''),
    ),

    InfoColumn(
      flex: 2,
      header: _buildTitle('Absence Number'.tr(context)),
      itemBuilder:
          (absence) => _buildInfo('   ${absence.nbOfAbsences}'),
    ),

    InfoColumn(
      flex: 2,
      header: _buildTitle('Justification'.tr(context)),
      itemBuilder:
          (absence) =>
              absence.hasJustification ?? false
                  ? AppButton.hyperLink(
                    text: 'See'.tr(context),
                    onPressed:
                        () => _showJustificationDialog(
                          context,
                          absence,
                        ),
                  )
                  : SizedBox.shrink(),
    ),

    //Buttons to justify or unjustify the absence
    InfoColumn(
      flex: 3,
      header: _buildTitle('Is Justified'.tr(context)),
      itemBuilder: (absence) {
        return AppButton.secondary(
          text:
              absence.isJustified ?? false
                  ? 'Justified'.tr(context)
                  : 'Not Justified'.tr(context),
          color:
              absence.isJustified ?? false
                  ? Colors.green
                  : AppColors.red,
          textColor:
              absence.isJustified ?? false
                  ? Colors.green
                  : AppColors.red,

          isLoading:
              (context) => context.select(
                (AbsencesCubit cubit) =>
                    cubit.state.isAbsenceLoading(absence),
              ),

          onPressed:
              () => context.alertDialog(
                title: 'Justification'.tr(context),
                content:
                    absence.isJustified ?? false
                        ? 'UnjustifyAbsenceConfirmation'.tr(context)
                        : 'JustifyAbsenceConfirmation'.tr(context),
                onConfirm:
                    () =>
                        absence.isJustified ?? false
                            ? context
                                .read<AbsencesCubit>()
                                .markAbsenceUnjustified(absence)
                            : context
                                .read<AbsencesCubit>()
                                .markAbsenceJustified(absence),
              ),
        );
      },
    ),
  ];

  void _showJustificationDialog(
    BuildContext context,
    AbsenceModel? absence,
  ) {
    context.dialogWith<bool>(
      child: BlocProvider(
        create: (_) => JustificationCubit(absence?.id ?? ''),
        child: AbsenceDetailsView(),
      ),
      onResult: (isAccepted) {
        context.read<AbsencesCubit>().updateAbsence(absence!);
      },
    );
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
