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
      flex: 4,
      header: _buildTitle('Subject'.tr(context)),
      itemBuilder: (absence) => _buildInfo(absence.subjectName ?? ''),
    ),

    InfoColumn(
      flex: 4,
      header: _buildTitle('Absence Since'.tr(context)),
      itemBuilder:
          (absence) =>
              _buildInfo(absence.absentSince?.toDayMonthYear() ?? ''),
    ),

    InfoColumn(
      flex: 2,
      header: _buildTitle('Justification'.tr(context)),
      itemBuilder:
          (absence) =>
              absence.hasJustification ?? false
                  ? AppButton.hyperLink(
                    text: 'See Justification'.tr(context),
                    onPressed:
                        () => _showJustificationDialog(
                          context,
                          absence.student,
                        ),
                  )
                  : SizedBox.shrink(),
    ),

    //Buttons to justify or unjustify the absence
    InfoColumn(
      flex: 2,
      header: _buildTitle('Is Justified'.tr(context)),
      itemBuilder: (absence) {
        return AppButton.primary(
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
                  ? AppColors.white
                  : AppColors.black,

          isLoading:
              (context) => context.select(
                (AbsencesCubit cubit) =>
                    cubit.state.isAbsenceLoading(absence),
              ),

          onPressed:
              () =>
                  _showJustificationDialog(context, absence.student),
        );
      },
    ),
  ];

  void _showJustificationDialog(
    BuildContext context,
    StudentModel? student,
  ) {
    //TODO : show justification dialog
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
