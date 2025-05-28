part of 'teacher_dto.dart';

class CreateTeacherDto extends TeacherDto {
  CreateTeacherDto()
    : super(
        firstNameController: TextEditingController(),
        lastNameController: TextEditingController(),
        emailController: TextEditingController(),
        addressController: TextEditingController(),
        phoneController: TextEditingController(),
        birthDateController: EditingController<DateTime>(
          DateTime.now(),
        ),
        genderController: EditingController<String>('Male'),
        subjectsController: ListEditingController<String>(),
        planningController: EditingController<PdfDTO>(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'address': addressController.text,
      'phone': phoneController.text,
      'password': "DEFAULT_PASSWORD_123@", //TODO change this to default password
      'birthDate': birthDateController.value?.toIso8601String(),
      'gender': genderController.value,
      'subjects': subjectsController.value,
    }.withoutNullsOrEmpty();
  }
}
