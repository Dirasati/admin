// ignore_for_file: library_private_types_in_public_api

part of 'absences_cubit.dart';

enum _AbsencesStatus { initial, loading, loaded, error }

class AbsencesState extends ErrorCubitState {
  final PaginationResult<AbsenceModel>? _result;
  final _AbsencesStatus _status;

  AbsencesState({
    PaginationResult<AbsenceModel>? result,
    _AbsencesStatus status = _AbsencesStatus.initial,
    String? error,
  }) : _result = result,
       _status = status,
       super(error);

  factory AbsencesState.initial() =>
      AbsencesState(status: _AbsencesStatus.initial);

  AbsencesState _copyWith({
    PaginationResult<AbsenceModel>? result,
    _AbsencesStatus? status,
    String? error,
  }) {
    return AbsencesState(
      result: result ?? _result,
      status: status ?? _status,
      error: error,
    );
  }

  bool isAbsenceLoading(AbsenceModel absence) => false;

  AbsencesState _loading() =>
      _copyWith(status: _AbsencesStatus.loading);

  AbsencesState _loadingAbsence(AbsenceModel absence) =>
      _LoadingState(absence, this);

  AbsencesState _loaded(PaginationResult<AbsenceModel> result) =>
      _copyWith(result: result, status: _AbsencesStatus.loaded);

  AbsencesState _error(String error) =>
      _copyWith(status: _AbsencesStatus.error, error: error);

  AbsencesState _replaceAbsence(AbsenceModel schoolAbsence) {
    final result = _result ?? PaginationResult<AbsenceModel>();

    return _loaded(result.replace(schoolAbsence));
  }
}

class _LoadingState extends AbsencesState {
  final AbsenceModel? absence;
  _LoadingState(this.absence, AbsencesState state)
    : super(status: _AbsencesStatus.loaded, result: state._result);

  @override
  bool isAbsenceLoading(AbsenceModel absence) =>
      this.absence == absence;
}
