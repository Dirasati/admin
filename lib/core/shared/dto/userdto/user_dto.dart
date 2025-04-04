import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/core/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';

abstract class UserDto extends FormDTO {
  final TextEditingController nameController;

  UserDto({required this.nameController});

  @override
  void dispose() {
    nameController.dispose();
  }

  String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'FieldIsRequired'.tr(context);
    }
    return null;
  }
}

class CreateUserDto extends UserDto {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  CreateUserDto()
    : emailController = TextEditingController(),
      passwordController = TextEditingController(),
      super(nameController: TextEditingController());

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
  }

  String? validateEmail(String? value, BuildContext context) {
    return value.isValidEmail ? null : 'InvalidEmail'.tr(context);
  }

  String? validatePassword(String? value, BuildContext context) =>
      value.isValidPassword ? null : 'InvalidPassword'.tr(context);
}

class UpdateUserDto extends UserDto {
  final UserModel _user;

  UpdateUserDto(this._user)
    : super(nameController: TextEditingController(text: _user.name));

  String get id => _user.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      if (nameController.text != _user.name)
        'name': nameController.text,
    };
  }
}
