import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/schoolclass/data/dto/school_class_dto.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:dirasaty_admin/features/schoolclass/data/repository/school_class_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'school_class_form_state.dart';

abstract class SchoolClassFormCubit<T extends SchoolClassDTO>
    extends Cubit<SchoolClassFormState<T>> {
  final _repository = locator<SchoolClassRepo>();

  SchoolClassFormCubit() : super(SchoolClassFormState.initial());

  bool get isLoading =>
      state._status == _SchoolClassFormStatus.loading;
  bool get isLoaded => state._dto != null;

  T get dto => state._dto!;

  void init();

  void _save();

  void save() {
    if (isLoading || !dto.validate()) return;
    _save();
  }
}

class CreateSchoolClassCubit
    extends SchoolClassFormCubit<CreateSchoolClassDto> {
  CreateSchoolClassCubit() : super();

  @override
  void init() {
    emit(state._loaded(CreateSchoolClassDto()));
  }

  @override
  void _save() async {
    emit(state._loading());

    final response = await _repository.createSchoolClass(dto);

    response.when(
      success: (model) => emit(state._saved(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}

class UpdateSchoolClassCubit
    extends SchoolClassFormCubit<UpdateSchoolClassDto> {
  final SchoolClassModel _class;

  UpdateSchoolClassCubit(this._class) : super();

  @override
  void init() => emit(state._loaded(UpdateSchoolClassDto(_class)));

  @override
  void _save() async {
    emit(state._loading());

    final response = await _repository.updateSchoolClass(dto);

    response.when(
      success: (model) => emit(state._saved(model)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
