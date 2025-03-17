import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'student_api.g.dart';

@RestApi()
abstract class StudentApi {
  factory StudentApi(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _StudentApi;

  @GET('/students')
  Future<PaginatedDataResponse> getStudents(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/students/{id}')
  Future<SingleDataResponse> getStudent(@Path('id') String id);

  @POST('/students')
  Future<SingleDataResponse> createStudent(
    @Body() Map<String, dynamic> data,
  );

  @PATCH('/students/{id}')
  Future<SingleDataResponse> updateStudent(
    @Path('id') String id,
    @Body() Map<String, dynamic> data,
  );

  @DELETE('/students/{id}')
  Future<SingleDataResponse> deleteStudent(@Path('id') String id);
}
