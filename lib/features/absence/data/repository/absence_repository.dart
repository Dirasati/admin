import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/features/absence/data/dto/absence_filter.dart';
import 'package:dirasaty_admin/features/absence/data/model/absence_model.dart';
import 'package:dirasaty_admin/features/absence/data/model/justification_model.dart';
import 'package:injectable/injectable.dart';

import '../source/absence_api.dart';

@lazySingleton
class AbsenceRepo extends NetworkRepository {
  final _absenceApi = locator<AbsenceApi>();

  RepoListResult<AbsenceModel> getAbsences(AbsenceFilterDTO filters) {
    return tryApiCall(() async {
      final response = await _absenceApi.getAbsences(
        queries: filters.toJson(),
      );
      return PaginationResult.fromResponse(
        response: response,
        fromJson: AbsenceModel.fromJson,
      );
    });
  }

  RepoResult<AbsenceModel> getAbsence(String id) {
    return tryApiCall(() async {
      final response = await _absenceApi.getAbsence(id: id);
      return AbsenceModel.fromJson(response.data!);
    });
  }

  RepoResult<AbsenceModel> markAsJustified(AbsenceModel absence) {
    return tryApiCall(() async {
      final response = await _absenceApi.updateAbsence(
        id: absence.id!,
        body: {"isJustified": true},
      );
      return AbsenceModel.fromJson(response.data!);
    });
  }

  RepoResult<AbsenceModel> markAsUnjustified(AbsenceModel absence) {
    return tryApiCall(() async {
      final response = await _absenceApi.updateAbsence(
        id: absence.id!,
        body: {"isJustified": false},
      );
      return AbsenceModel.fromJson(response.data!);
    });
  }

  RepoResult<void> deleteAbsence(AbsenceModel absence) {
    return tryApiCall(
      () async => await _absenceApi.deleteAbsence(id: absence.id!),
    );
  }

  RepoResult<void> updateJustification(JustificationModel justification,  String status) {
    return tryApiCall(() async {
      await _absenceApi.updateJustification(
        id: justification.id!,
        body: {"status": status},
      );
    });
  }
}
