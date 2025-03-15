part of 'student_dto.dart';

class UpdateStudentDto extends UpdateUserDto {
  final StudentModel _student;

  final TextEditingController codeController;
  final TextEditingController levelController;
  final ListEditingcontroller<ParentReferenceDTO> parentsReferences;
  final BooleanEditingController isClassNull;

  UpdateStudentDto(this._student)
    : codeController = TextEditingController(text: _student.code),
      levelController = TextEditingController(text: _student.level),
      parentsReferences = ListEditingcontroller<ParentReferenceDTO>(
        _student.parentsReferences
            .map((e) => ParentReferenceDTO.fromModel(e))
            .toList(),
      ),
      isClassNull = BooleanEditingController(
        _student.schoolClass == null,
      ),
      super(_student);

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
    levelController.dispose();
    parentsReferences.dispose();
    isClassNull.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      ...await super.toMap(),
      if (_student.code != codeController.text)
        'code': codeController.text,

      if (_student.level != levelController.text)
        'level': levelController.text,

      if (_student.schoolClass == null && !isClassNull.value)
        'schoolClass': null,

      if (_student.parentsReferences.any(
        (e) => parentsReferences.value.every(
          (element) => element.isModified(e),
        ),
      ))
        'parentsReferences': parentsReferences.value.map(
          (e) => e.toMap(),
        ),
    }.withoutNullsOrEmpty();
  }
}
