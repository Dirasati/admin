part of 'parent_dto.dart';

class UpdateParentDto extends ParentDto {
  final ParentModel _parent;

  UpdateParentDto(this._parent)
    : super(
        firstNameController: TextEditingController(
          text: _parent.firstName,
        ),
        lastNameController: TextEditingController(
          text: _parent.lastName,
        ),
        emailController: TextEditingController(text: _parent.email),
        passwordController: TextEditingController(),
        phoneController: TextEditingController(text: _parent.phone),
        addressController: TextEditingController(
          text: _parent.address,
        ),
        genderController: EditingController<String>(_parent.gender),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (firstNameController.text != _parent.firstName)
        'first_name': firstNameController.text,

      if (lastNameController.text != _parent.lastName)
        'last_name': lastNameController.text,

      if (emailController.text != _parent.email)
        'email': emailController.text,

      if (passwordController.text.isNotEmpty)
        'password': passwordController.text,

      if (phoneController.text != _parent.phone)
        'phone': phoneController.text,

      if (addressController.text != _parent.address)
        'address': addressController,

      if (genderController.value != _parent.gender)
        'gender': genderController.value,
    }.withoutNullsOrEmpty();
  }

  String get id => _parent.id!;
}
