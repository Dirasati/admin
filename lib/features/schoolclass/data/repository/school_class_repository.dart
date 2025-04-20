import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:dirasaty_admin/features/schoolclass/data/dto/school_class_dto.dart';
import 'package:injectable/injectable.dart';

import '../model/school_class_model.dart';
import '../source/school_class_api.dart';

@lazySingleton
class SchoolClassRepo extends NetworkRepository {
  final _schoolClassApi = locator<SchoolClassApi>();

  RepoListResult<SchoolClassModel> getSchoolClasses(
    PaginationDto pagination,
  ) async {
    return tryApiCall(() async {
      final response = await _schoolClassApi.getSchoolClasses(
        pagination.toJson(),
      );
      return PaginationResult.fromResponse(
        response: response,
        fromJson: SchoolClassModel.fromJson,
      );
    });
  }

  RepoResult<SchoolClassModel> getSchoolClass(String id) async {
    return tryApiCall(() async {
      final response = await _schoolClassApi.getSchoolClass(id);
      return SchoolClassModel.fromJson(response.data!);
    });
  }

  RepoResult<SchoolClassModel> createSchoolClass(
    CreateSchoolClassDto dto,
  ) async {
    return tryApiCall(() async {
      final response = await _schoolClassApi.createSchoolClass(
        await dto.toMap(),
      );
      return SchoolClassModel.fromJson(response.data!);
    });
  }

  RepoResult<SchoolClassModel> updateSchoolClass(
    UpdateSchoolClassDto dto,
  ) async {
    return tryApiCall(() async {
      final response = await _schoolClassApi.updateSchoolClass(
        dto.id,
        await dto.toMap(),
      );
      return SchoolClassModel.fromJson(response.data!);
    });
  }

  RepoResult<SchoolClassModel> deleteSchoolClass(String id) async {
    return tryApiCall(() async {
      final response = await _schoolClassApi.deleteSchoolClass(id);
      return SchoolClassModel.fromJson(response.data!);
    });
  }
}
