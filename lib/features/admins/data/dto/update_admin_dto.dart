part of 'admin_dto.dart';

class UpdateAdminDto extends AdminDTO {
  final AdminModel _admin;

  UpdateAdminDto(this._admin)
    : super(
        firstNameController: TextEditingController(
          text: _admin.firstName,
        ),
        lastNameController: TextEditingController(
          text: _admin.lastName,
        ),
        emailController: TextEditingController(text: _admin.email),
        addressController: TextEditingController(
          text: _admin.address,
        ),
        phoneController: TextEditingController(text: _admin.phone),
        genderController: EditingController(_admin.gender),
      );

  String get id => _admin.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (_admin.firstName != firstNameController.text)
        'firstName': firstNameController.text,

      if (_admin.lastName != lastNameController.text)
        'lastName': lastNameController.text,

      if (_admin.email != emailController.text)
        'email': emailController.text,

      if (_admin.address != addressController.text)
        'address': addressController.text,

      if (_admin.phone != phoneController.text)
        'phone': phoneController.text,

      if (_admin.gender != genderController.value)
        'gender': genderController.value,
    }.withoutNullsOrEmpty();
  }
}
