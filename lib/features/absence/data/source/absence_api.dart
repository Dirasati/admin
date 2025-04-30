import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'absence_api.g.dart';

@RestApi()
@lazySingleton
abstract class AbsenceApi {
  @factoryMethod
  factory AbsenceApi(Dio dio) = _AbsenceApi;

  @GET('/absences')
  Future<PaginatedDataResponse> getAbsences({
    @Queries() Map<String, dynamic>? queries,
  });

  @GET('/absences/{id}')
  Future<SingleDataResponse> getAbsence({
    @Path('id') required String id,
  });

  @PATCH('/absences/{id}')
  Future<SingleDataResponse> updateAbsence({
    @Path('id') required String id,
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('/absences/{id}')
  Future<MessageResponse> deleteAbsence({
    @Path('id') required String id,
  });
}
