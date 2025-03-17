import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/core/shared/models/parent_reference_model.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:flutter/material.dart';

part 'parent_reference.dart';
part 'update_student_dto.dart';

abstract class StudentDto extends FormDTO {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController codeController;
  final EditingController<String> levelController;
  final ListEditingController<ParentReferenceDTO> parentsReferences;

  StudentDto({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.parentsReferences,
    required this.codeController,
    required this.levelController,
  });

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    parentsReferences.dispose();
    codeController.dispose();
    levelController.dispose();
  }

  String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'NameIsRequired'.tr(context);
    }
    return null;
  }

  String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'EmailIsRequired'.tr(context);
    }
    return null;
  }

  String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'PasswordIsRequired'.tr(context);
    }
    return null;
  }

  String? validateCode(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'CodeIsRequired'.tr(context);
    }
    return null;
  }

  String? validateLevel(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'LevelIsRequired'.tr(context);
    }
    return null;
  }
}

class CreateStudentDto extends StudentDto {
  CreateStudentDto()
    : super(
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        parentsReferences:
            ListEditingController<ParentReferenceDTO>(),
        codeController: TextEditingController(),
        levelController: EditingController<String>(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'code': codeController.text,
      'level': levelController.value,
      'parentsReferences': parentsReferences.value.map(
        (e) => e.toMap(),
      ),
    }.withoutNullsOrEmpty();
  }
}
