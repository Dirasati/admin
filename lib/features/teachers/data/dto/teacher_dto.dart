import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:flutter/widgets.dart';

part 'create_teacher_dto.dart';
part 'update_teacher_dto.dart';

abstract class TeacherDto extends FormDTO {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final EditingController<DateTime> birthDateController;
  final EditingController<String> genderController;
  final ListEditingController<String> subjectsController;

  TeacherDto({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.addressController,
    required this.phoneController,
    required this.birthDateController,
    required this.genderController,
    required this.subjectsController,
  });

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    birthDateController.dispose();
  }
}
