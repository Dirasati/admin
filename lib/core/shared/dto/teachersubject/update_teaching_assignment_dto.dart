part of 'teaching_assignment_dto.dart';

class UpdateTeachingAssignmentDTO extends TeachingAssignmentDTO {
  final SubjectTeacherModel _model;

  UpdateTeachingAssignmentDTO(this._model)
    : super(
        teacherController: EditingController<TeacherModel>(
          _model.teacher,
        ),
        subjectController: EditingController<SubjectModel>(
          _model.subject,
        ),
      );

  @override
  bool get isModified =>
      teacherController.value?.id != _model.teacher?.id ||
      subjectController.value?.id != _model.subject?.id;

 
}
