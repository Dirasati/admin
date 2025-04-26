part of 'school_class_dto.dart';

class UpdateSchoolClassDto extends SchoolClassDTO {
  final SchoolClassModel _schoolClass;

  String get id => _schoolClass.id!;

  UpdateSchoolClassDto(this._schoolClass)
    : super(
        nameController: TextEditingController(
          text: _schoolClass.name,
        ),
        levelController: EditingController<String>(
          _schoolClass.level,
        ),
        planingController: EditingController<PdfDTO>(
          _schoolClass.planing != null
              ? RemotePdfDTO(_schoolClass.planing!)
              : null,
        ),

        teachingAssignments:
            ListEditingController<TeachingAssignmentDTO>(
              _schoolClass.subjects
                  ?.map((e) => TeachingAssignmentDTO.fromModel(e))
                  .toList(),
            ),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    final planingUrl = await planingController.value?.url;
    return {
      if (_schoolClass.name != nameController.text)
        'name': nameController.text,

      if (_schoolClass.level != levelController.value)
        'level': levelController.value,

      if (_schoolClass.planing != planingUrl) 'planing': planingUrl,

      // TODO add condition to check if the teaching assignments have changed
      'teachingAssignments': await Future.wait(
        teachingAssignments.value.map(
          (assignment) => assignment.toMap(),
        ),
      ),
    };
  }
}
