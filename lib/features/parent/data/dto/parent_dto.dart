import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:flutter/widgets.dart';

part 'create_paent_dto.dart';
part 'update_paent_dto.dart';

abstract class ParentDto extends FormDTO {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final EditingController<String> genderController;

  ParentDto({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.addressController,
    required this.genderController,
  });

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}
