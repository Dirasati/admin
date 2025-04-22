part of 'student_dto.dart';

class UpdateStudentDto extends StudentDto {
  UpdateStudentDto(this._student)
    : isClassNull = BooleanEditingController(
        _student.schoolClass == null,
      ),
      super(
        codeController: TextEditingController(text: _student.code),
        emailController: TextEditingController(text: _student.email),
        levelController: EditingController<String>(_student.level),
        birthDateController: EditingController<DateTime>(
          _student.birthDate,
        ),
        inscriptionDateController: EditingController<DateTime>(
          _student.inscriptionDate,
        ),
        addressController: TextEditingController(
          text: _student.address,
        ),
        firstNameController: TextEditingController(
          text: _student.firstName,
        ),
        lastNameController: TextEditingController(
          text: _student.lastName,
        ),
        genderController: EditingController<String>(_student.gender),
        phoneController: TextEditingController(text: _student.phone),
        parentsReferencesController:
            ListEditingController<ParentReferenceDTO>(
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
    isClassNull.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (_student.firstName != firstNameController.text)
        'firstName': firstNameController.text,

      if (_student.lastName != lastNameController.text)
        'lastName': lastNameController.text,

      if (_student.birthDate != birthDateController.value)
        'birthDate': birthDateController.value,

      if (_student.inscriptionDate != inscriptionDateController.value)
        'inscriptionDate': inscriptionDateController.value,

      if (_student.address != addressController.text)
        'address': addressController.text,

      if (_student.email != emailController.text)
        'email': emailController.text,

      if (_student.code != codeController.text)
        'code': codeController.text,

      if (_student.level != levelController.value)
        'level': levelController.value,

      if (_student.schoolClass == null && !isClassNull.value)
        'schoolClass': null,

      if (_student.parentsReferences?.any(
            (e) => parentsReferencesController.value.every(
              (element) => element.isModified(e),
            ),
          ) ??
          false)
        'parentsReferences': parentsReferencesController.value.map(
          (e) => e.toMap(),
        ),
    }.withoutNullsOrEmpty();
  }
}
