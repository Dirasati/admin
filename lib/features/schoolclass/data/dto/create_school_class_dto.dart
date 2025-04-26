part of 'school_class_dto.dart';

class CreateSchoolClassDto extends SchoolClassDTO {
  CreateSchoolClassDto()
    : super(
        nameController: TextEditingController(),
        levelController: EditingController<String>(),
        planingController: EditingController<PdfDTO>(),
        teachingAssignments:
            ListEditingController<TeachingAssignmentDTO>(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'name': nameController.text,
      
      'level': levelController.value,

      'planing': await planingController.value?.url,

      'teachingAssignments': await Future.wait(
        teachingAssignments.value.map(
          (assignment) => assignment.toMap(),
        ),
      ),
    };
  }
}
