import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parent_dto.dart';
import '../models/parent_model.dart';
import '../source/parent_api.dart';

class ParentRepo extends NetworkRepository {
  final _parentApi = locator<ParentApi>();

  RepoListResult<ParentModel> getParents(PaginationDto dto) {
    return tryApiCall(() async {
      final response = await _parentApi.getParents(dto.toJson());
      return PaginationResult.fromResponse(
        response: response,
        fromJson: ParentModel.fromJson,
      );
    });
  }

  RepoResult<ParentModel> getParent(String id) {
    return tryApiCall(() async {
      final response = await _parentApi.getParent(id);
      return ParentModel.fromJson(response.data!);
    });
  }

  RepoResult<ParentModel> createParent(CreateParentDto dto) {
    return tryApiCall(() async {
      final response = await _parentApi.createParent(
        await dto.toMap(),
      );
      return ParentModel.fromJson(response.data!);
    });
  }

  RepoResult<ParentModel> updateParent(UpdateParentDto dto) {
    return tryApiCall(() async {
      final response = await _parentApi.updateParent(
        dto.id,
        await dto.toMap(),
      );
      return ParentModel.fromJson(response.data!);
    });
  }

  RepoResult<void> deleteParent(ParentModel parent) {
    return tryApiCall(
      () async => await _parentApi.deleteParent(parent.id!),
    );
  }
}
