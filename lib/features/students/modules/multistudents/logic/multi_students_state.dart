// ignore_for_file: library_private_types_in_public_api

part of 'multi_students_cubit.dart';

enum _MultiStudentsStatus { initial, loading, loaded, error }

class StudentsListState extends ErrorState {
  final PaginationResult<StudentModel> _studentsResult;
  final _MultiStudentsStatus _status;

  StudentsListState({
    required PaginationResult<StudentModel> studentsResult,
    required _MultiStudentsStatus status,
    String? error,
  }) : _studentsResult = studentsResult,
       _status = status,
       super(error);

  bool get isLoading => _status == _MultiStudentsStatus.loading;

  factory StudentsListState.initial() => StudentsListState(
    studentsResult: PaginationResult(),
    status: _MultiStudentsStatus.initial,
  );

  StudentsListState _loading() =>
      _copyWith(status: _MultiStudentsStatus.loading);

  StudentsListState _loaded(
    PaginationResult<StudentModel> studentsResult,
  ) {
    return _copyWith(
      studentsResult: studentsResult,
      status: _MultiStudentsStatus.loaded,
    );
  }

  StudentsListState _addStudent(StudentModel student) {
    final students =
        List<StudentModel>.from(_studentsResult.data)
          ..addUniqueFirst(student)
          ..removeLast();

    final result = _studentsResult.copyWith(data: students);

    return _loaded(result);
  }

  StudentsListState _removeStudent(StudentModel student) {
    final students = List<StudentModel>.from(_studentsResult.data)
      ..remove(student);

    final result = _studentsResult.copyWith(data: students);

    return _loaded(result);
  }

  StudentsListState _replaceStudent(StudentModel student) {
    final students = List<StudentModel>.from(_studentsResult.data)
      ..replace(student);

    final result = _studentsResult.copyWith(data: students);

    return _loaded(result);
  }

  StudentsListState _error(String error) =>
      _copyWith(status: _MultiStudentsStatus.error, error: error);

  StudentsListState _copyWith({
    PaginationResult<StudentModel>? studentsResult,
    _MultiStudentsStatus? status,
    String? error,
  }) {
    return StudentsListState(
      studentsResult: studentsResult ?? _studentsResult,
      status: status ?? _status,
      error: error,
    );
  }
}
