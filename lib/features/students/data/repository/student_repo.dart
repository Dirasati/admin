import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';

import '../dto/student_dto.dart';
import '../dto/students_filter.dart';
import '../model/student_model.dart';
import '../source/student_api.dart';


class StudentRepo extends NetworkRepository {
  final _studentApi = locator<StudentApi>();

  RepoListResult<StudentModel> getStudents(StudentsFilter filter) {
    return tryApiCall(() async {
      final response = await _studentApi.getStudents(filter.toJson());
      return PaginationResult.fromResponse(
        response: response,
        fromJson: StudentModel.fromJson,
      );
    });
  }

  RepoResult<StudentModel> getStudent(String id) {
    return tryApiCall(() async {
      final response = await _studentApi.getStudent(id);
      return StudentModel.fromJson(response.data!);
    });
  }

  RepoResult<StudentModel> createStudent(CreateStudentDto dto) {
    return tryApiCall(() async {
      final response = await _studentApi.createStudent(
        await dto.toMap(),
      );
      return StudentModel.fromJson(response.data!);
    });
  }

  RepoResult<StudentModel> updateStudent(UpdateStudentDto dto) {
    return tryApiCall(() async {
      final response = await _studentApi.updateStudent(
        dto.id,
        await dto.toMap(),
      );
      return StudentModel.fromJson(response.data!);
    });
  }

  RepoResult<void> deleteStudent(StudentModel student) {
    return tryApiCall(
      () async => await _studentApi.deleteStudent(student.id!),
    );
  }
}
