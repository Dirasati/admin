import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/extension/list.extension.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/students/data/dto/students_filter.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:dirasaty_admin/features/students/data/repository/student_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'multi_students_state.dart';

class StudentsListCubit extends Cubit<StudentsListState> {
  final StudentRepo _studentRepo;

  final StudentsFilter _filter = StudentsFilter();

  StudentsFilter get filter => _filter;

  List<StudentModel> get students => state._studentsResult.data;
  Pagination get pagination => state._studentsResult.pagination;

  StudentsListCubit()
    : _studentRepo = locator(),
      super(StudentsListState.initial());

  void firstPage() {
    _filter.firstPage();
    _loadStudents();
  }

  void nextPage() {
    emit(StudentsListState.initial());

    _filter.nextPage();
    _loadStudents();
  }

  void prevPage() {
    emit(StudentsListState.initial());

    _filter.prevPage();
    _loadStudents();
  }

  void _loadStudents() async {
    if (state.isLoading) return;
    emit(state._loading());

    final result = await _studentRepo.getStudents(_filter);

    result.when(
      success: (students) => emit(state._loaded(students)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void addStudent(StudentModel student) =>
      emit(state._addStudent(student));

  void removeStudent(StudentModel student) async {
    emit(state._loading());

    final result = await _studentRepo.deleteStudent(student);

    result.when(
      success: (_) => emit(state._removeStudent(student)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void replaceStudent(StudentModel student) =>
      emit(state._replaceStudent(student));

  @override
  Future<void> close() {
    _filter.dispose();
    return super.close();
  }
}
