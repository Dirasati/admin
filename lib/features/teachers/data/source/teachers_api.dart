import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'teachers_api.g.dart';

@RestApi()
@lazySingleton
abstract class TeachersApi {
  @factoryMethod
  factory TeachersApi(Dio dio) = _TeachersApi;

  @GET('/teachers')
  Future<PaginatedDataResponse> getTeachers(
    @Queries() Map<String, dynamic>? queries,
  );

  @GET('/teachers/{id}')
  Future<SingleDataResponse> getTeacher(@Path('id') String id);

  @POST('/teachers')
  Future<SingleDataResponse> createTeacher(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/teachers/{id}')
  Future<SingleDataResponse> updateTeacher(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/teachers/{id}')
  Future<MessageResponse> deleteTeacher(@Path('id') String id);
}
