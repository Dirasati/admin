import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'school_class_api.g.dart';

@RestApi()
@lazySingleton
abstract class SchoolClassApi {
  @factoryMethod
  factory SchoolClassApi(Dio dio) = _SchoolClassApi;

  @GET('/schoolClasses')
  Future<PaginatedDataResponse> getSchoolClasses(
    @Queries() Map<String, dynamic>? queries,
  );

  @GET('/schoolClasses/{id}')
  Future<SingleDataResponse> getSchoolClass(@Path('id') String id);

  @POST('/schoolClasses')
  Future<SingleDataResponse> createSchoolClass(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/schoolClasses/{id}')
  Future<SingleDataResponse> updateSchoolClass(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/schoolClasses/{id}')
  Future<MessageResponse> deleteSchoolClass(@Path('id') String id);
}
