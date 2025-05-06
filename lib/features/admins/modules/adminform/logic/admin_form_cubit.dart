import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/admins/data/dto/admin_dto.dart';
import 'package:dirasaty_admin/features/admins/data/model/admin_model.dart';
import 'package:dirasaty_admin/features/admins/data/repository/admins_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_form_state.dart';

abstract class AdminFormCubit<T extends AdminDTO>
    extends Cubit<AdminFormState<T>> {
  final _repository = locator<AdminsRepo>();

  AdminFormCubit() : super(AdminFormState.initial()) {
    loadDto();
  }

  T get dto => state._dto!;

  bool get _canSave => !state.isLoading && dto.validate();

  void loadDto();

  void save() {
    if (_canSave) _save();
  }

  void _save();

  @override
  Future<void> close() {
    state._dto?.dispose();
    return super.close();
  }
}

class CreateAdminCubit extends AdminFormCubit<CreateAdminDto> {
  CreateAdminCubit() : super();

  @override
  void loadDto() => emit(state._loaded(CreateAdminDto()));

  @override
  void _save() async {
    emit(state._loading());
    final result = await _repository.createAdmin(dto);
    result.when(
      success: (model) => emit(state._success(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}

class UpdateAdminCubit extends AdminFormCubit<UpdateAdminDto> {
  final AdminModel _admin;

  UpdateAdminCubit(this._admin) : super();

  @override
  void loadDto() => emit(state._loaded(UpdateAdminDto(_admin)));

  @override
  void _save() async {
    emit(state._loading());
    final result = await _repository.updateAdmin(dto);
    result.when(
      success: (model) => emit(state._success(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
