import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/shared/dto/userdto/user_dto.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/students/data/dto/student_dto.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:dirasaty_admin/features/students/data/repository/student_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_form_state.dart';

abstract class StudentFormCubit<T extends UserDto>
    extends Cubit<StudentFormState<T>> {
  final _studentRepo = locator<StudentRepo>();

  StudentFormCubit() : super(StudentFormState.initial());

  T get dto => state._dto!;

  void load();

  void save();
}

class CreateStudentCubit extends StudentFormCubit<CreateStudentDto> {
  CreateStudentCubit() : super();

  @override
  void load() => emit(state._loaded(CreateStudentDto()));

  @override
  void save() async {
    emit(state._loading());

    final result = await _studentRepo.createStudent(dto);

    result.when(
      success: (student) => emit(state._saved(student)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}

class UpdateStudentCubit extends StudentFormCubit<UpdateStudentDto> {
  final String _studentId;

  UpdateStudentCubit(this._studentId) : super();

  @override
  void load() async {
    emit(state._loading());

    final result = await _studentRepo.getStudent(_studentId);

    result.when(
      success:
          (student) => emit(state._loaded(UpdateStudentDto(student))),
      error: (error) => emit(state._error(error.message)),
    );
  }

  @override
  void save() async {
    emit(state._loading());

    final result = await _studentRepo.updateStudent(dto);

    result.when(
      success: (student) => emit(state._saved(student)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
