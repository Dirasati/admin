part of 'school_class_details_cubit.dart';

enum _SchoolClassDetailsStatus { initial, loading, loaded, saved, error }

class SchoolClassDetailsState<T> extends ErrorCubitState {
  final T? _dto;
  final _SchoolClassDetailsStatus _status;

  SchoolClassDetailsState._({
    T? dto,
    _SchoolClassDetailsStatus status = _SchoolClassDetailsStatus.initial,
    String? error,
  }) : _dto = dto,
       _status = status,
       super(error);

  factory SchoolClassDetailsState.initial() => SchoolClassDetailsState._();

  SchoolClassDetailsState<T> _copyWith({
    T? dto,
    _SchoolClassDetailsStatus? status,
    String? error,
  }) {
    return SchoolClassDetailsState._(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  SchoolClassDetailsState<T> _loading() =>
      _copyWith(status: _SchoolClassDetailsStatus.loading);

  SchoolClassDetailsState<T> _loaded(T dto) =>
      _copyWith(dto: dto, status: _SchoolClassDetailsStatus.loaded);

  SchoolClassDetailsState<T> _saved(SchoolClassModel model) =>
      _SavedState(dto: _dto, model: model);

  SchoolClassDetailsState<T> _error(String error) =>
      _copyWith(status: _SchoolClassDetailsStatus.error, error: error);

  void onSaved(ValueChanged<SchoolClassModel> onSaved) {}
}

class _SavedState<T> extends SchoolClassDetailsState<T> {
  final SchoolClassModel _model;

  _SavedState({
    super.dto,
    required SchoolClassModel model,
    super.error,
    super.status = _SchoolClassDetailsStatus.saved,
  }) : _model = model,
       super._();

  @override
  void onSaved(ValueChanged<SchoolClassModel> onSaved) =>
      onSaved(_model);
}
