part of 'school_class_form_cubit.dart';

enum _SchoolClassFormStatus { initial, loading, loaded, saved, error }

class SchoolClassFormState<T> extends ErrorState {
  final T? _dto;
  final _SchoolClassFormStatus _status;

  SchoolClassFormState._({
    T? dto,
    _SchoolClassFormStatus status = _SchoolClassFormStatus.initial,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  factory SchoolClassFormState.initial() => SchoolClassFormState._();

  SchoolClassFormState<T> _copyWith({
    T? dto,
    _SchoolClassFormStatus? status,
    String? error,
  }) {
    return SchoolClassFormState._(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  SchoolClassFormState<T> _loading() =>
      _copyWith(status: _SchoolClassFormStatus.loading);

  SchoolClassFormState<T> _loaded(T dto) =>
      _copyWith(dto: dto, status: _SchoolClassFormStatus.loaded);

  SchoolClassFormState<T> _saved(SchoolClassModel model) =>
      _SavedState(dto: _dto, model: model);

  SchoolClassFormState<T> _error(String error) =>
      _copyWith(status: _SchoolClassFormStatus.error, error: error);

  void onSaved(ValueChanged<SchoolClassModel> onSaved) {}
}

class _SavedState<T> extends SchoolClassFormState<T> {
  final SchoolClassModel _model;

  _SavedState({
    super.dto,
    required SchoolClassModel model,
    super.error,
    super.status = _SchoolClassFormStatus.saved,
  }) : _model = model,
       super._();

  @override
  void onSaved(ValueChanged<SchoolClassModel> onSaved) =>
      onSaved(_model);
}
