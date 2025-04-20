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

  @GET('/school-classes')
  Future<PaginatedDataResponse> getSchoolClasses(
    @Queries() Map<String, dynamic>? queries,
  );

  @GET('/school-classes/{id}')
  Future<SingleDataResponse> getSchoolClass(@Path('id') String id);

  @POST('/school-classes')
  Future<SingleDataResponse> createSchoolClass(
    @Body() Map<String, dynamic> body,
  );

  @PUT('/school-classes/{id}')
  Future<SingleDataResponse> updateSchoolClass(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/school-classes/{id}')
  Future<SingleDataResponse> deleteSchoolClass(@Path('id') String id);
}
