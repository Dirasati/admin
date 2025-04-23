import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/teachers/data/dto/teacher_dto.dart';
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:dirasaty_admin/features/teachers/data/repository/teachers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teacher_form_state.dart';

abstract class TeacherFormCubit<T extends TeacherDto>
    extends Cubit<TeacherFormState<T>> {
  final _repository = locator<TeachersRepo>();

  TeacherFormCubit() : super(TeacherFormState.initial()) {
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

class CreateTeacherCubit extends TeacherFormCubit<CreateTeacherDto> {
  CreateTeacherCubit() : super();

  @override
  void loadDto() => emit(state._loaded(CreateTeacherDto()));

  @override
  void _save() async {
    emit(state._loading());
    final result = await _repository.createTeacher(dto);

    result.when(
      success: (model) => emit(state._success(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}

class UpdateTeacherCubit extends TeacherFormCubit<UpdateTeacherDto> {
  final TeacherModel _teacher;

  UpdateTeacherCubit(this._teacher) : super();

  @override
  Future<void> loadDto() async {
    emit(state._loaded(UpdateTeacherDto(_teacher)));
  }

  @override
  void _save() async {
    emit(state._loading());
    final result = await _repository.updateTeacher(dto);

    result.when(
      success: (model) => emit(state._success(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
