
import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/subject/data/dto/subject_dto.dart';
import 'package:dirasaty_admin/features/subject/data/model/subject_model.dart';
import 'package:dirasaty_admin/features/subject/data/repository/subject_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subject_form_state.dart';

abstract class SubjectFormCubit<T extends SubjectDto>
    extends Cubit<SubjectFormState<T>> {
  final _repository = locator<SubjectRepo>();

  SubjectFormCubit() : super(SubjectFormState.initial());

  T get dto => state._dto!;

  bool get _canSave => !state.isLoading && dto.validate();

  void loadDto();

  void save() {
    if (_canSave) _save();
  }

  void _save();
}

class CreateSubjectCubit extends SubjectFormCubit<CreateSubjectDto> {
  CreateSubjectCubit() : super();

  @override
  Future<void> loadDto() async {
    emit(state._loaded(CreateSubjectDto()));
  }

  @override
  void _save() async {
    emit(state._loading());
    final result = await _repository.createSubject(dto);

    result.when(
      success: (model) => emit(state._success(model)),
      error: (error) => emit(state._failure(error.message)),
    );
  }
}

class UpdateSubjectCubit extends SubjectFormCubit<UpdateSubjectDto> {
  final SubjectModel _subject;

  UpdateSubjectCubit(this._subject) : super();

  @override
  Future<void> loadDto() async {
    emit(state._loaded(UpdateSubjectDto(_subject)));
  }

  @override
  void _save() async {
    emit(state._loading());
    final result = await _repository.updateSubject(dto);

    result.when(
      success: (model) => emit(state._success(model)),
      error: (error) => emit(state._failure(error.message)),
    );
  }
}
