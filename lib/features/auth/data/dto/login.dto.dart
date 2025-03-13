import 'package:flutter/widgets.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';

class LoginDTO extends FormDTO {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value, BuildContext context) =>
      value.isValidLogin ? null : 'InvalidEmail'.tr(context);

  String? validatePassword(String? value, BuildContext context) =>
      value.isValidPassword ? null : 'IncorrectPassword'.tr(context);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'email': emailController.text,
      'password': passwordController.text,
    };
  }
}
