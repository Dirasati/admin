import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/features/subject/data/dto/subject_dto.dart';
import 'package:dirasaty_admin/features/subject/data/dto/subject_filter.dart';
import 'package:dirasaty_admin/features/subject/data/model/subject_model.dart';
import 'package:injectable/injectable.dart';

import '../source/subject_api.dart';

@lazySingleton
class SubjectRepo extends NetworkRepository {
  final _subjectApi = locator<SubjectApi>();

  RepoListResult<SubjectModel> fetchSubjects(
    SubjectFilter queryParams,
  ) async {
    return tryApiCall(() async {
      final response = await _subjectApi.getSubjects(
        queryParams.toJson(),
      );
      return PaginationResult.fromResponse(
        response: response,
        fromJson: SubjectModel.fromJson,
      );
    });
  }

  RepoResult<SubjectModel> createSubject(CreateSubjectDto dto) async {
    return tryApiCall(() async {
      final response = await _subjectApi.createSubject(
        await dto.toMap(),
      );
      return SubjectModel.fromJson(response.data!);
    });
  }

  RepoResult<SubjectModel> updateSubject(UpdateSubjectDto dto) async {
    return tryApiCall(() async {
      final response = await _subjectApi.updateSubject(
        dto.id,
        await dto.toMap(),
      );
      return SubjectModel.fromJson(response.data!);
    });
  }

  RepoResult<void> deleteSubject(String id) async {
    return tryApiCall(
      () async => await _subjectApi.deleteSubject(id),
    );
  }
}
