import 'package:dirasaty_admin/core/extension/validator.extension.dart';
import 'package:flutter/widgets.dart';
import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';

class ForgotPasswordDto extends FormDTO {
  final TextEditingController emailController;

  ForgotPasswordDto({String? email})
    : emailController = TextEditingController(text: email);

  String? validateEmail(String? value, BuildContext context) =>
      value.isValidEmail ? null : 'InvalidEmail'.tr(context);

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {'email': emailController.text};
  }
}

class OtpDTO extends ForgotPasswordDto {
  final TextEditingController otpController;

  String? validateOtp(String? value, BuildContext context) =>
      value?.length == 4 ? null : 'InvalidOtp'.tr(context);

  OtpDTO({required super.email, String? otp})
    : otpController = TextEditingController(text: otp);

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {'email': emailController.text, ...await super.toMap()};
  }

  Map<String, dynamic> toResendMap() {
    return {'email': emailController.text};
  }
}

class NewPasswordDTO extends OtpDTO {
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? validatePassword(String? value, BuildContext context) =>
      value.isValidPassword ? null : 'InvalidPassword'.tr(context);

  String? validateConfirmPassword(
    String? value,
    BuildContext context,
  ) =>
      value == passwordController.text
          ? null
          : 'PasswordNotMatch'.tr(context);

  NewPasswordDTO({required super.email, required super.otp});

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'password': passwordController.text,
      ...await super.toMap(),
    };
  }
}
