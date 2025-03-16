part of 'student_form_cubit.dart';

enum _StudentFormStatus { initial, loading, loaded, saved, error }

class StudentFormState<T extends UserDto> extends ErrorState {
  final T? _dto;
  final _StudentFormStatus _status;

  StudentFormState._({
    T? dto,
    required _StudentFormStatus status,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  bool get isLoaded => _dto != null;
  bool get isLoading =>
      _status == _StudentFormStatus.loading || _dto == null;

  factory StudentFormState.initial() =>
      StudentFormState._(status: _StudentFormStatus.initial);

  StudentFormState<T> _loading() =>
      _copyWith(status: _StudentFormStatus.loading);

  StudentFormState<T> _loaded(T dto) =>
      _copyWith(dto: dto, status: _StudentFormStatus.loaded);

  StudentFormState<T> _saved(StudentModel student) =>
      _SavedState(student);

  StudentFormState<T> _error(String error) =>
      _copyWith(status: _StudentFormStatus.error, error: error);

  StudentFormState<T> _copyWith({
    T? dto,
    _StudentFormStatus? status,
    String? error,
  }) => StudentFormState._(
    dto: dto ?? _dto,
    status: status ?? _status,
    error: error,
  );

  onSaved(void Function(StudentModel student) callback) {}
}

class _SavedState<T extends UserDto> extends StudentFormState<T> {
  final StudentModel student;

  _SavedState(this.student)
    : super._(status: _StudentFormStatus.saved);

  @override
  onSaved(void Function(StudentModel student) callback) =>
      callback(student);
}
