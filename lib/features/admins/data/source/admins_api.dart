import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'admins_api.g.dart';

@RestApi()
@lazySingleton
abstract class AdminsApi {
  @factoryMethod
  factory AdminsApi(Dio dio) = _AdminsApi;


   @GET('/admins')
  Future<PaginatedDataResponse> getAdmins(
    @Queries() Map<String, dynamic>? queries,
  );

  @GET('/admins/{id}')
  Future<SingleDataResponse> getAdmin(@Path('id') String id);

  @POST('/admins')
  Future<SingleDataResponse> createAdmin(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/admins/{id}')
  Future<SingleDataResponse> updateAdmin(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/admins/{id}')
  Future<MessageResponse> deleteAdmin(@Path('id') String id);
}
