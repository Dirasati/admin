import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'payment_api.g.dart';

@RestApi()
@lazySingleton
abstract class PaymentApi {
  @factoryMethod
  factory PaymentApi(Dio dio) = _PaymentApi;

  @GET('tuition-fee')
  Future<PaginatedDataResponse> getTuitionFee({
    @Queries() required Map<String, dynamic> queries,
  });

  @GET('payment/{tuitionFeeId}')
  Future<PaginatedDataResponse> getPayments({
    @Path('tuitionFeeId') required String tuitionFeeId,
    @Queries() required Map<String, dynamic> queries,
  });

  @POST('payment')
  Future<SingleDataResponse> createPayment({
    @Body() required Map<String, dynamic> body,
  });
}
