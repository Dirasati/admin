import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/features/teachers/data/dto/teacher_dto.dart';
import 'package:dirasaty_admin/features/teachers/data/dto/teacher_filter.dart';
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:injectable/injectable.dart';

import '../source/teachers_api.dart';

@lazySingleton
class TeachersRepo extends NetworkRepository {
  final _teachersApi = locator<TeachersApi>();

  RepoListResult<TeacherModel> getTeachers(TeacherFilterDto filters) {
    return tryApiCall(() async {
      final response = await _teachersApi.getTeachers(
        filters.toJson(),
      );

      return PaginationResult.fromResponse(
        response: response,
        fromJson: TeacherModel.fromJson,
      );
    });
  }

  RepoResult<TeacherModel> getTeacher(String id) =>
      tryApiCall(() async {
        final response = await _teachersApi.getTeacher(id);

        return TeacherModel.fromJson(response.data!);
      });

  RepoResult<TeacherModel> createTeacher(CreateTeacherDto dto) =>
      tryApiCall(() async {
        final response = await _teachersApi.createTeacher(
          await dto.toMap(),
        );

        return TeacherModel.fromJson(response.data!);
      });

  RepoResult<TeacherModel> updateTeacher(UpdateTeacherDto dto) =>
      tryApiCall(() async {
        final response = await _teachersApi.updateTeacher(
          dto.id,
          await dto.toMap(),
        );

        return TeacherModel.fromJson(response.data!);
      });

  RepoResult<void> deleteTeacher(String id) =>
      tryApiCall(() => _teachersApi.deleteTeacher(id));
}
