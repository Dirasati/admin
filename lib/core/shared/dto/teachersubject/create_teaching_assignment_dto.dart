part of 'teaching_assignment_dto.dart';

class CreateTeachingAssignmentDTO extends TeachingAssignmentDTO {
  CreateTeachingAssignmentDTO(SubjectModel subject)
    : super(
        teacherController: EditingController<TeacherModel>(),
        subjectController: EditingController<SubjectModel>(subject),
      );

  @override
  bool get isModified => true;

  
}
