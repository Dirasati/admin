// ignore_for_file: library_private_types_in_public_api

part of 'parent_form_cubit.dart';

enum _ParentFormStatus { initial, loading, loaded, saved, error }

class ParentFormState<T extends ParentDto> extends ErrorCubitState {
  final T? _dto;
  final _ParentFormStatus _status;

  ParentFormState({T? dto, _ParentFormStatus? status, String? error})
    : _dto = dto,
      _status = status ?? _ParentFormStatus.initial,
      super(error);

  factory ParentFormState.initial() => ParentFormState();

  bool get isLoading => _status == _ParentFormStatus.loading;
  bool get isLoaded => _dto != null;

  ParentFormState<T> _loading() {
    return _copyWith(status: _ParentFormStatus.loading);
  }

  ParentFormState<T> _loaded(T dto) {
    return _copyWith(dto: dto, status: _ParentFormStatus.loaded);
  }

  ParentFormState<T> _saved(ParentModel model) => _Saved(model, this);

  ParentFormState<T> _error(String error) {
    return _copyWith(error: error, status: _ParentFormStatus.error);
  }

  ParentFormState<T> _copyWith({
    T? dto,
    _ParentFormStatus? status,
    String? error,
  }) {
    return ParentFormState(
      dto: dto ?? _dto,
      status: status ?? _status,
      error: error,
    );
  }

  void onSaved(void Function(ParentModel model) callback) {}
}

class _Saved<T extends ParentDto> extends ParentFormState<T> {
  final ParentModel _model;

  _Saved(this._model, ParentFormState<T> state)
    : super(dto: state._dto, status: _ParentFormStatus.saved);

  @override
  void onSaved(void Function(ParentModel model) callback) {
    callback(_model);
  }
}
