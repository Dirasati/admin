import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/core/shared/models/subject_teacher_model.dart';
import 'package:dirasaty_admin/features/subject/data/model/subject_model.dart';
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:equatable/equatable.dart';

part 'create_teaching_assignment_dto.dart';
part 'update_teaching_assignment_dto.dart';

abstract class TeachingAssignmentDTO extends Equatable with FormDTO {
  final EditingController<TeacherModel> teacherController;
  final EditingController<SubjectModel> subjectController;

  TeachingAssignmentDTO({
    required this.teacherController,
    required this.subjectController,
  });

  bool get isModified;

  @override
  void dispose() {
    teacherController.dispose();
    subjectController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'teacher': teacherController.value?.id,
      'subject': subjectController.value?.id,
    }.withoutNullsOrEmpty();
  }

  @override
  List<Object?> get props => [subjectController.value];
}
