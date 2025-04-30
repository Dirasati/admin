import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parent_dto.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/data/repository/parent_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'parent_form_state.dart';

abstract class ParentFormCubit<T extends ParentDto>
    extends Cubit<ParentFormState<T>> {
  final _parentRepo = locator<ParentRepo>();

  ParentFormCubit() : super(ParentFormState.initial());

  T get dto => state._dto!;

  void loadDto();

  void save();

  @override
  Future<void> close() {
    state._dto?.dispose();
    return super.close();
  }
}

class CreateParentCubit extends ParentFormCubit<CreateParentDto> {
  @override
  void loadDto() {
    emit(state._loaded(CreateParentDto()));
  }

  @override
  void save() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    final result = await _parentRepo.createParent(dto);

    result.when(
      success: (model) => emit(state._saved(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}

class UpdateParentCubit extends ParentFormCubit<UpdateParentDto> {
  final String _id;

  UpdateParentCubit(this._id);

  @override
  void loadDto() async {
    emit(state._loading());

    final result = await _parentRepo.getParent(_id);

    result.when(
      success: (model) => emit(state._loaded(UpdateParentDto(model))),
      error: (error) => emit(state._error(error.message)),
    );
  }

  @override
  void save() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    final result = await _parentRepo.updateParent(dto);

    result.when(
      success: (model) => emit(state._saved(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
