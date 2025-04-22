import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/subject/data/model/subject_model.dart';
import 'package:flutter/widgets.dart';

part 'create_subject_dto.dart';
part 'update_subject_dto.dart';

abstract class SubjectDto extends FormDTO {
  final TextEditingController nameController;
  final EditingController<String> levelController;
  final EditingController<int> coefficientController;
  final BooleanEditingController isMainController;

  SubjectDto({
    required this.nameController,
    required this.levelController,
    required this.coefficientController,
    required this.isMainController,
  });

  @override
  void dispose() {
    nameController.dispose();
    levelController.dispose();
    coefficientController.dispose();
    isMainController.dispose();
  }
}
