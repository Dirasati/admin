// ignore_for_file: library_private_types_in_public_api

part of 'school_classes_cubit.dart';

enum _SchoolClassesStatus { initial, loading, loaded, error }

class SchoolClassesState extends ErrorState {
  final PaginationResult<SchoolClassModel>? _result;
  final _SchoolClassesStatus _status;

  SchoolClassesState({
    PaginationResult<SchoolClassModel>? result,
    _SchoolClassesStatus status = _SchoolClassesStatus.initial,
    String? error,
  }) : _result = result,
       _status = status,
       super(error);

  factory SchoolClassesState.initial() =>
      SchoolClassesState(status: _SchoolClassesStatus.initial);

  SchoolClassesState _copyWith({
    PaginationResult<SchoolClassModel>? result,
    _SchoolClassesStatus? status,
    String? error,
  }) {
    return SchoolClassesState(
      result: result ?? _result,
      status: status ?? _status,
      error: error,
    );
  }

  SchoolClassesState _loading() =>
      _copyWith(status: _SchoolClassesStatus.loading);

  SchoolClassesState _loaded(
    PaginationResult<SchoolClassModel> result,
  ) => _copyWith(result: result, status: _SchoolClassesStatus.loaded);

  SchoolClassesState _error(String error) =>
      _copyWith(status: _SchoolClassesStatus.error, error: error);

  SchoolClassesState _addClass(SchoolClassModel schoolClass) {
    final result = _result ?? PaginationResult<SchoolClassModel>();

    final classes =
        List<SchoolClassModel>.from(result.data)
          ..addUniqueFirst(schoolClass)
          ..removeLast();

    return _loaded(result.copyWith(data: classes));
  }

  SchoolClassesState _removeClass(SchoolClassModel schoolClass) {
    final result = _result ?? PaginationResult<SchoolClassModel>();

    return _loaded(result.remove(schoolClass));
  }

  SchoolClassesState _replaceClass(SchoolClassModel schoolClass) {
    final result = _result ?? PaginationResult<SchoolClassModel>();

    return _loaded(result.replace(schoolClass));
  }
}
