import 'package:dirasaty_admin/core/extension/localization.extension.dart';
import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parent_refernce_dto.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:flutter/material.dart';

part 'update_student_dto.dart';

abstract class StudentDto extends FormDTO {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController codeController;
  final EditingController<String> levelController;
  final EditingController<DateTime> birthDateController;
  final EditingController<DateTime> inscriptionDateController;
  final EditingController<String> genderController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final ListEditingController<ParentReferenceDTO>
  parentsReferencesController;

  StudentDto({
    required this.codeController,
    required this.levelController,
    required this.birthDateController,
    required this.inscriptionDateController,
    required this.genderController,
    required this.phoneController,
    required this.addressController,
    required this.parentsReferencesController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
  });

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    codeController.dispose();
    levelController.dispose();
    birthDateController.dispose();
    inscriptionDateController.dispose();
    genderController.dispose();
    phoneController.dispose();
    addressController.dispose();
    parentsReferencesController.dispose();
  }
}

class CreateStudentDto extends StudentDto {
  CreateStudentDto()
    : super(
        firstNameController: TextEditingController(),
        lastNameController: TextEditingController(),
        emailController: TextEditingController(),
        codeController: TextEditingController(),
        levelController: EditingController<String>(),
        birthDateController: EditingController<DateTime>(),
        inscriptionDateController: EditingController<DateTime>(),
        addressController: TextEditingController(),
        genderController: EditingController<String>(),
        phoneController: TextEditingController(),
        parentsReferencesController:
            ListEditingController<ParentReferenceDTO>(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'birthDate': birthDateController.value,
      'inscriptionDate': inscriptionDateController.value,
      'address': addressController.text,
      'email': emailController.text,
      'password': 'DEFAULT_PASSWORD',
      'code': codeController.text,
      'level': levelController.value,
      'parentsReferences': parentsReferencesController.value.map(
        (e) => e.toMap(),
      ),
    }.withoutNullsOrEmpty();
  }
}
