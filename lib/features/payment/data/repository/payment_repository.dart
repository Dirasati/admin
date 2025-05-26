import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:dirasaty_admin/features/payment/data/dto/payment_dto.dart';
import 'package:dirasaty_admin/features/payment/data/dto/payments_filter_dto.dart';
import 'package:dirasaty_admin/features/payment/data/models/payment_model.dart';
import 'package:dirasaty_admin/features/payment/data/models/tuition_fee_model.dart';
import 'package:injectable/injectable.dart';

import '../source/payment_api.dart';

@lazySingleton
class PaymentRepo extends NetworkRepository {
  final _paymentApi = locator<PaymentApi>();

  RepoListResult<TuitionFeeModel> getTuitionFees(
    PaginationDto pagination,
  ) {
    return tryApiCall(() async {
      final response = await _paymentApi.getTuitionFee(
        queries: pagination.toJson(),
      );

      return PaginationResult.fromResponse(
        response: response,
        fromJson: TuitionFeeModel.fromJson,
      );
    });
  }

  RepoListResult<PaymentModel> getPayments(
    PaymentsFilterDto pagination,
  ) {
    return tryApiCall(() async {
      final response = await _paymentApi.getPayments(
        tuitionFeeId: pagination.tuitionFeeIdController.value!,
        queries: pagination.toJson(),
      );

      return PaginationResult.fromResponse(
        response: response,
        fromJson: PaymentModel.fromJson,
      );
    });
  }

  RepoResult<PaymentModel> createPayment(PaymentDto dto) {
    return tryApiCall(() async {
      final response = await _paymentApi.createPayment(
        body: await dto.toMap(),
      );

      return PaymentModel.fromJson(response.data!);
    });
  }
}
