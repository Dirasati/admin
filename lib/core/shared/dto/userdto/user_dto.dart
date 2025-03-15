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
