part of 'subject_dto.dart';

class CreateSubjectDto extends SubjectDto {
  CreateSubjectDto()
    : super(
        nameController: TextEditingController(),
        levelController: EditingController<String>(),
        coefficientController: EditingController<int>(),
        isMainController: BooleanEditingController(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'name': nameController.text,
      'level': levelController.value,
      'coefficient': coefficientController.value ,
      'isMain': isMainController.value,
    };
  }
}
