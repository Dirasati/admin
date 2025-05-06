import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/features/admins/data/dto/admin_dto.dart';
import 'package:dirasaty_admin/features/admins/data/dto/admin_filter_dto.dart';
import 'package:dirasaty_admin/features/admins/data/model/admin_model.dart';
import 'package:injectable/injectable.dart';

import '../source/admins_api.dart';

@lazySingleton
class AdminsRepo extends NetworkRepository {
  final _adminsApi = locator<AdminsApi>();

  RepoListResult<AdminModel> getAdmins(AdminFilterDto filters) {
    return tryApiCall(() async {
      final response = await _adminsApi.getAdmins(filters.toJson());

      return PaginationResult.fromResponse(
        response: response,
        fromJson: AdminModel.fromJson,
      );
    });
  }

  RepoResult<AdminModel> getAdmin(String id) => tryApiCall(() async {
    final response = await _adminsApi.getAdmin(id);

    return AdminModel.fromJson(response.data!);
  });

  RepoResult<AdminModel> createAdmin(CreateAdminDto dto) =>
      tryApiCall(() async {
        final response = await _adminsApi.createAdmin(
          await dto.toMap(),
        );

        return AdminModel.fromJson(response.data!);
      });

  RepoResult<AdminModel> updateAdmin(UpdateAdminDto dto) =>
      tryApiCall(() async {
        final response = await _adminsApi.updateAdmin(
          dto.id,
          await dto.toMap(),
        );

        return AdminModel.fromJson(response.data!);
      });

  RepoResult<void> deleteAdmin(String id) =>
      tryApiCall(() => _adminsApi.deleteAdmin(id));
}
