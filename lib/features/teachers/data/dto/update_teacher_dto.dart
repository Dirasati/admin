part of 'teacher_dto.dart';

class UpdateTeacherDto extends TeacherDto {
  final TeacherModel _teacher;

  UpdateTeacherDto(this._teacher)
    : super(
        firstNameController: TextEditingController(
          text: _teacher.firstName,
        ),

        lastNameController: TextEditingController(
          text: _teacher.lastName,
        ),

        emailController: TextEditingController(text: _teacher.email),

        addressController: TextEditingController(
          text: _teacher.address,
        ),

        phoneController: TextEditingController(text: _teacher.phone),

        birthDateController: EditingController<DateTime>(
          _teacher.birthDate,
        ),

        genderController: EditingController(_teacher.gender),

        subjectsController: ListEditingController<String>(
          _teacher.subjects,
        ),
      );

      String get id => _teacher.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (_teacher.firstName != firstNameController.text)
        'firstName': firstNameController.text,

      if (_teacher.lastName != lastNameController.text)
        'lastName': lastNameController.text,

      if (_teacher.email != emailController.text)
        'email': emailController.text,

      if (_teacher.address != addressController.text)
        'address': addressController.text,

      if (_teacher.phone != phoneController.text)
        'phone': phoneController.text,

      if (_teacher.birthDate != birthDateController.value)
        'birthDate': birthDateController.value?.toIso8601String(),

      if (_teacher.gender != genderController.value)
        'gender': genderController.value,

      if (_teacher.subjects != subjectsController.value)
        'subjects': subjectsController.value,
    }.withoutNullsOrEmpty();
  }
}
