import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:flutter/widgets.dart';

part 'create_school_class_dto.dart';
part 'update_school_class_dto.dart';

abstract class SchoolClassDto extends FormDTO {
  final TextEditingController nameController;
  final EditingController<String> levelController;

  SchoolClassDto({
    required this.nameController,
    required this.levelController,
  }) : super();

  @override
  void dispose() {
    nameController.dispose();
    levelController.dispose();
  }
}
