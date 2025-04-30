import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/teachers/data/dto/teacher_filter.dart';
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:dirasaty_admin/features/teachers/data/repository/teachers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teachers_state.dart';

class TeachersCubit extends Cubit<TeachersState> {
  final _repo = locator<TeachersRepo>();
  final _paginationDto = TeacherFilterDto();

  TeachersCubit() : super(TeachersState.initial());

  List<TeacherModel> get teachers => state._result.data;
  Pagination get pagination => state._result.pagination;
  TeacherFilterDto get filters => _paginationDto;

  void firstPage() {
    emit(TeachersState.initial());

    _paginationDto.firstPage();

    getTeachers();
  }

  void nextPage() {
    if (pagination.next != null) {
      _paginationDto.nextPage();

      getTeachers();
    }
  }

  void prevPage() {
    if (pagination.prev != null) {
      _paginationDto.prevPage();

      getTeachers();
    }
  }

  void getTeachers() async {
    if (state.isLoading) return;

    emit(state._loading());

    final result = await _repo.getTeachers(_paginationDto);

    emit(
      result.when(
        success: (result) => state._loaded(result),
        error: (error) => state._error(error.message),
      ),
    );
  }

  void addTeacher(TeacherModel teacher) {
    emit(state._add(teacher));
  }

  void updateTeacher(TeacherModel teacher) {
    emit(state._update(teacher));
  }

  void deleteTeacher(TeacherModel teacher) async {
    emit(state._loading());

    emit(state._delete(teacher));

    getTeachers();

    final result = await _repo.deleteTeacher(teacher.id!);

    emit(
      result.when(
        success: (_) => state,
        error: (error) => state._error(error.message),
      ),
    );
  }
}
