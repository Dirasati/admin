part of 'student_dto.dart';

class UpdateStudentDto extends StudentDto {
  UpdateStudentDto(this._student)
    : isClassNull = BooleanEditingController(
        _student.schoolClass == null,
      ),
      super(
        codeController: TextEditingController(text: _student.code),
        nameController: TextEditingController(text: _student.name),
        emailController: TextEditingController(text: _student.email),
        passwordController: TextEditingController(),
        levelController: EditingController<String>(_student.level),
        parentsReferences: ListEditingController<ParentReferenceDTO>(
          _student.parentsReferences
              ?.map((e) => ParentReferenceDTO.fromModel(e))
              .toList(),
        ),
      );

  final StudentModel _student;

  final BooleanEditingController isClassNull;

  String get id => _student.id!;

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
      if (_student.name != nameController.text)
        'name': nameController.text,

      if (_student.email != emailController.text)
        'email': emailController.text,

      if (_student.code != codeController.text)
        'code': codeController.text,

      if (_student.level != levelController.value)
        'level': levelController.value,

      if (_student.schoolClass == null && !isClassNull.value)
        'schoolClass': null,

      if (_student.parentsReferences?.any(
        (e) => parentsReferences.value.every(
          (element) => element.isModified(e),
        ),
      ) ?? false)
        'parentsReferences': parentsReferences.value.map(
          (e) => e.toMap(),
        ),
    }.withoutNullsOrEmpty();
  }
}
