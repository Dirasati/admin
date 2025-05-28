part of '../tuition_fee_screen.dart';

class _TuitionFeeList extends StatelessWidget {
  const _TuitionFeeList();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TuitionFeesCubit>();

    return cubit.state.isLoading
        ? AppLoadingWidget()
        : InfoTable(
          columns: _generateColumns(context),
          items: cubit.fees,
        );
  }

  List<InfoColumn<TuitionFeeModel>> _generateColumns(
    BuildContext context,
  ) => [
    InfoColumn(
      flex: 6,
      header: _buildTitle("Student".tr(context)),
      itemBuilder: (fee) => _buildInfo(fee.student?.fullName ?? '-'),
    ),
    InfoColumn(
      flex: 3,
      header: _buildTitle("Total".tr(context)),
      itemBuilder:
          (fee) => _buildInfo('${fee.amount?.toString() ?? '-'} DA'),
    ),
     InfoColumn(
      flex: 3,
      header: _buildTitle("PaidAmount".tr(context)),
      itemBuilder:
          (fee) => _buildInfo('${fee.paidAmount?.toString() ?? '-'} DA'),
    ),

    InfoColumn(
      flex: 3,
      header: _buildTitle("Payment Mode".tr(context)),
      itemBuilder: (fee) => _buildInfo(fee.paymentMode ?? '-'),
    ),
    InfoColumn(
      flex: 4,
      header: _buildTitle("Next Payment Date".tr(context)),
      itemBuilder: (fee) {
        final dateStr =
            fee.nextPaymentDate != null
                ? fee.nextPaymentDate?.toDayMonthYear() ?? '-'
                : '-';
        final isPast =
            fee.nextPaymentDate != null &&
            fee.nextPaymentDate!.isBefore(DateTime.now());
        return Text(
          dateStr,
          style: AppTextStyles.medium.copyWith(
            color: isPast ? Colors.red : Colors.green,
            fontWeight: isPast ? FontWeight.bold : FontWeight.normal,
          ),
        );
      },
    ),
    InfoColumn(
      flex: 3,
      header: _buildTitle("Next Payment Amount".tr(context)),
      itemBuilder:
          (fee) => _buildInfo(
            '${fee.nextPaymentAmount?.toString() ?? '-'} DA',
          ),
    ),
    InfoColumn(
      flex: 2,
      header: SizedBox.shrink(),
      itemBuilder:
          (fee) => IconButton(
            icon: Icon(Icons.payment),
            tooltip: "Make Payment",
            onPressed: () {
              context.dialogWith<PaymentDto>(
                child: BlocProvider(
                  create:
                      (_) => MultiParentCubit(
                        ParentsFilter(studentId: fee.student!.id!),
                      )..firstPage(),
                  child: PaymentDialog(
                    parents:
                        fee.student!.parentsReferences
                            ?.map((e) => e.parent!)
                            .toList() ??
                        [],
                  ),
                ),
                onResult: (paymentDto) {
                  paymentDto.tuitionFeeController.value = fee;

                  context.read<TuitionFeesCubit>().payFee(paymentDto);
                },
              );
            },
          ),
    ),
  ];

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
