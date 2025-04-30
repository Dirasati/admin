// ignore_for_file: library_private_types_in_public_api

part of 'justification_cubit.dart';

enum _JustificationStatus { initial, loading, loaded, error }

class JustificationState extends ErrorCubitState {
  final AbsenceModel? _absence;
  final _JustificationStatus _status;

  JustificationState({
    AbsenceModel? absence,
    _JustificationStatus status = _JustificationStatus.initial,
    String? error,
  }) : _absence = absence,
       _status = status,
       super(error);

  factory JustificationState.initial() => JustificationState();

  JustificationState _copyWith({
    AbsenceModel? absence,
    _JustificationStatus? status,
    String? error,
  }) {
    return JustificationState(
      absence: absence ?? _absence,
      status: status ?? _status,
      error: error,
    );
  }

  JustificationState _loading() {
    return _copyWith(status: _JustificationStatus.loading);
  }

  JustificationState _loaded(AbsenceModel absence) {
    return _copyWith(
      absence: absence,
      status: _JustificationStatus.loaded,
    );
  }

  JustificationState _error(String error) {
    return _copyWith(
      status: _JustificationStatus.error,
      error: error,
    );
  }
}
