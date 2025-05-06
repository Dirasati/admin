import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/admins/data/dto/admin_filter_dto.dart';
import 'package:dirasaty_admin/features/admins/data/model/admin_model.dart';
import 'package:dirasaty_admin/features/admins/data/repository/admins_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admins_state.dart';

class AdminsCubit extends Cubit<AdminsState> {
  final _repo = locator<AdminsRepo>();
  final _paginationDto = AdminFilterDto();

  AdminsCubit() : super(AdminsState.initial());

  List<AdminModel> get admins => state._result.data;
  Pagination get pagination => state._result.pagination;
  AdminFilterDto get filters => _paginationDto;

  void firstPage() {
    emit(AdminsState.initial());

    _paginationDto.firstPage();

    getAdmins();
  }

  void nextPage() {
    if (pagination.next != null) {
      _paginationDto.nextPage();

      getAdmins();
    }
  }

  void prevPage() {
    if (pagination.prev != null) {
      _paginationDto.prevPage();

      getAdmins();
    }
  }

  void getAdmins() async {
    if (state.isLoading) return;

    emit(state._loading());

    final result = await _repo.getAdmins(_paginationDto);

    emit(
      result.when(
        success: (result) => state._loaded(result),
        error: (error) => state._error(error.message),
      ),
    );
  }

  void addAdmin(AdminModel admin) {
    emit(state._add(admin));
  }

  void updateAdmin(AdminModel admin) {
    emit(state._update(admin));
  }

  void deleteAdmin(AdminModel admin) async {
    emit(state._loading());

    emit(state._delete(admin));

    getAdmins();

    final result = await _repo.deleteAdmin(admin.id!);

    emit(
      result.when(
        success: (_) => state,
        error: (error) => state._error(error.message),
      ),
    );
  }
}
