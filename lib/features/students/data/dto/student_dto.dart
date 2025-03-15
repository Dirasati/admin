import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/userdto/user_dto.dart';
import 'package:dirasaty_admin/core/shared/models/parent_reference_model.dart';
import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:flutter/material.dart';

part 'parent_reference.dart';
part 'update_student_dto.dart';

class CreateStudentDto extends CreateUserDto {
  final TextEditingController codeController;
  final TextEditingController levelController;
  final ListEditingcontroller<ParentReferenceDTO> parentsReferences;

  CreateStudentDto()
    : codeController = TextEditingController(),
      levelController = TextEditingController(),
      parentsReferences = ListEditingcontroller<ParentReferenceDTO>(),
      super();

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
    levelController.dispose();
    parentsReferences.dispose();
  }

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      ...await super.toMap(),
      'code': codeController.text,
      'level': levelController.text,
      'parentsReferences': parentsReferences.value.map(
        (e) => e.toMap(),
      ),
    }.withoutNullsOrEmpty();
  }
}
