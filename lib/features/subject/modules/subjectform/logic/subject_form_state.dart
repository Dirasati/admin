// ignore_for_file: library_private_types_in_public_api

part of 'subject_form_cubit.dart';

enum _SubjectFormStatus { initial, loading, loaded, success, failure }

class SubjectFormState<T> extends ErrorCubitState {
  final T? _dto;
  final _SubjectFormStatus _status;

  SubjectFormState({
    T? dto,
    _SubjectFormStatus status = _SubjectFormStatus.initial,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  factory SubjectFormState.initial() => SubjectFormState();

  bool get isLoading => _status == _SubjectFormStatus.loading;
  bool get isLoaded => _dto != null;

  SubjectFormState<T> _copyWith({
    T? dto,
    _SubjectFormStatus? status,
    String? error,
  }) {
    return SubjectFormState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  SubjectFormState<T> _loading() =>
      _copyWith(status: _SubjectFormStatus.loading);

  SubjectFormState<T> _loaded(T dto) =>
      _copyWith(dto: dto, status: _SubjectFormStatus.loaded);

  SubjectFormState<T> _success(SubjectModel model) =>
      _SavedState(dto: _dto, model: model);

  SubjectFormState<T> _failure(String error) =>
      _copyWith(status: _SubjectFormStatus.failure, error: error);

  void onSaved(ValueChanged<SubjectModel> onSaved) {}
}

class _SavedState<T> extends SubjectFormState<T> {
  final SubjectModel _model;

  _SavedState({
    super.dto,
    required SubjectModel model,
    super.status = _SubjectFormStatus.success,
  }) : _model = model;

  @override
  void onSaved(ValueChanged<SubjectModel> onSaved) => onSaved(_model);
}
