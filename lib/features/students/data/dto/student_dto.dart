import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parent_refernce_dto.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:flutter/material.dart';

part 'update_student_dto.dart';

abstract class StudentDto with FormDTO {
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
  final TextEditingController amountController;
  final EditingController<String> paymentModeController;

  CreateStudentDto()
    : amountController = TextEditingController(),
      paymentModeController = EditingController<String>(),
      super(
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
      'birthDate': birthDateController.value?.toIso8601String(),
      'inscriptionDate':
          inscriptionDateController.value?.toIso8601String(),
      'address': addressController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': 'DEFAULT_PASSWORD',
      'code': codeController.text,
      'level': levelController.value,
      'gender': genderController.value,
      'parentsReferences': await Future.wait(
        parentsReferencesController.value.map((e) => e.toMap()),
      ),
      'amount': int.tryParse(amountController.text),
      'paymentMode': paymentModeController.value,
    }.withoutNullsOrEmpty();
  }
}
