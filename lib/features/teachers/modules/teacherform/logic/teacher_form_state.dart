part of 'teacher_form_cubit.dart';

enum _TeacherFormStatus { initial, loading, loaded, saved, error }

class TeacherFormState<T extends TeacherDto> extends ErrorCubitState {
  final T? _dto;
  final _TeacherFormStatus _status;

  TeacherFormState._({
    T? dto,
    required _TeacherFormStatus status,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  bool get isLoaded => _dto != null;
  bool get isLoading =>
      _status == _TeacherFormStatus.loading || _dto == null;

  factory TeacherFormState.initial() =>
      TeacherFormState._(status: _TeacherFormStatus.initial);

  TeacherFormState<T> _loading() =>
      _copyWith(status: _TeacherFormStatus.loading);

  TeacherFormState<T> _loaded(T dto) =>
      _copyWith(dto: dto, status: _TeacherFormStatus.loaded);

  TeacherFormState<T> _success(TeacherModel teacher) =>
      _SavedState(teacher);

  TeacherFormState<T> _error(String error) =>
      _copyWith(status: _TeacherFormStatus.error, error: error);

  TeacherFormState<T> _copyWith({
    T? dto,
    _TeacherFormStatus? status,
    String? error,
  }) => TeacherFormState._(
    dto: dto ?? _dto,
    status: status ?? _status,
    error: error,
  );

  onSaved(void Function(TeacherModel teacher) callback) {}
}

class _SavedState<T extends TeacherDto> extends TeacherFormState<T> {
  final TeacherModel teacher;

  _SavedState(this.teacher)
    : super._(status: _TeacherFormStatus.saved);

  @override
  onSaved(void Function(TeacherModel teacher) callback) =>
      callback(teacher);
}
