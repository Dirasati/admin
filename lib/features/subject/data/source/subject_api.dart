import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'subject_api.g.dart';

@RestApi()
@lazySingleton
abstract class SubjectApi {
  @factoryMethod
  factory SubjectApi(Dio dio) = _SubjectApi;

  @GET('/subjects')
  Future<PaginatedDataResponse> getSubjects(
    @Queries() Map<String, dynamic> queryParams,
  );

  @POST('/subjects')
  Future<SingleDataResponse> createSubject(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/subjects/{id}')
  Future<SingleDataResponse> updateSubject(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/subjects/{id}')
  Future<MessageResponse> deleteSubject(@Path('id') String id);
}
