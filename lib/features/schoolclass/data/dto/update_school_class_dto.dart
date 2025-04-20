part of 'school_class_dto.dart';

class UpdateSchoolClassDto extends SchoolClassDto {
  final SchoolClassModel _schoolClass;

  UpdateSchoolClassDto(this._schoolClass)
    : super(
        nameController: TextEditingController(
          text: _schoolClass.name,
        ),
        levelController: EditingController<String>(
          _schoolClass.level,
        ),
      );

  String get id => _schoolClass.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (_schoolClass.name != nameController.text)
        'name': nameController.text,

      if (_schoolClass.level != levelController.value)
        'level': levelController.value,
    };
  }
}
