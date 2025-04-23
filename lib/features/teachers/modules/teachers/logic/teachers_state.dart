part of 'teachers_cubit.dart';

enum _TeachersStatus { initial, loading, loaded, error }

class TeachersState extends ErrorCubitState {
  final PaginationResult<TeacherModel> _result;
  final _TeachersStatus status;

  TeachersState({
    required PaginationResult<TeacherModel> result,
    // ignore: library_private_types_in_public_api
    _TeachersStatus? status,
    String? error,
  }) : _result = result,
       status = status ?? _TeachersStatus.initial,
       super(error);

  factory TeachersState.initial() => TeachersState(
    result: PaginationResult(),
    status: _TeachersStatus.initial,
  );

  TeachersState _copyWith({
    PaginationResult<TeacherModel>? result,
    _TeachersStatus? status,
    String? error,
  }) {
    return TeachersState(
      result: result ?? _result,
      status: status ?? this.status,
      error: error,
    );
  }

  bool get isLoading => status == _TeachersStatus.loading;

  TeachersState _loading() =>
      _copyWith(status: _TeachersStatus.loading);

  TeachersState _loaded(PaginationResult<TeacherModel> result) =>
      _copyWith(result: result, status: _TeachersStatus.loaded);

  TeachersState _add(TeacherModel teacher) => _copyWith(
    result: _result.addFirst(teacher)..data.removeLast(),
    status: _TeachersStatus.loaded,
  );

  TeachersState _update(TeacherModel teacher) => _copyWith(
    result: _result.replace(teacher),
    status: _TeachersStatus.loaded,
  );

  TeachersState _delete(TeacherModel teacher) => _copyWith(
    result: _result.remove(teacher),
    status: _TeachersStatus.loaded,
  );

  TeachersState _error(String error) =>
      _copyWith(status: _TeachersStatus.error, error: error);
}
