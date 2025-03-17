import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'parent_api.g.dart';

@RestApi()
abstract class ParentApi {
  factory ParentApi(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ParentApi;

  @GET('/parents')
  Future<PaginatedDataResponse> getParents(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/parents/{id}')
  Future<SingleDataResponse> getParent(@Path('id') String id);

  @POST('/parents')
  Future<SingleDataResponse> createParent(
    @Body() Map<String, dynamic> data,
  );

  @PATCH('/parents/{id}')
  Future<SingleDataResponse> updateParent(
    @Path('id') String id,
    @Body() Map<String, dynamic> data,
  );

  @DELETE('/parents/{id}')
  Future<SingleDataResponse> deleteParent(@Path('id') String id);
}
