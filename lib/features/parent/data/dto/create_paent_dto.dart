part of 'parent_dto.dart';

class CreateParentDto extends ParentDto {
  CreateParentDto()
    : super(
        firstNameController: TextEditingController(),
        lastNameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        phoneController: TextEditingController(),
        addressController: TextEditingController(),
        genderController: EditingController<String>(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'password':
          'DEFAULT_PASSWORD', //TODO change this to a generated password
      'phone': phoneController.text,
      'address': addressController.text,
      'gender': genderController.value,
    };
  }
}
