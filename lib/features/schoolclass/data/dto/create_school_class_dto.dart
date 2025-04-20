part of 'school_class_dto.dart';

class CreateSchoolClassDto extends SchoolClassDto {
  CreateSchoolClassDto()
    : super(
        nameController: TextEditingController(),
        levelController: EditingController<String>(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'name': nameController.text,
      'level': levelController.value,
    };
  }
}
