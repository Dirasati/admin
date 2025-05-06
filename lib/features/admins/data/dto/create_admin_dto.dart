part of 'admin_dto.dart';

class CreateAdminDto extends AdminDTO {
  CreateAdminDto()
    : super(
        firstNameController: TextEditingController(),
        lastNameController: TextEditingController(),
        emailController: TextEditingController(),
        addressController: TextEditingController(),
        phoneController: TextEditingController(),
        genderController: EditingController(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'address': addressController.text,
      'phone': phoneController.text,
      'password':
          "DEFAULT_PASSWORD_123@", //TODO change this to default password
      'gender': genderController.value,
    }.withoutNullsOrEmpty();
  }
}
