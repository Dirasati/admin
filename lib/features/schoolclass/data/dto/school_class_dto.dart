import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/filedto/file_dto.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/core/shared/dto/teachersubject/teaching_assignment_dto.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:flutter/widgets.dart';

part 'create_school_class_dto.dart';
part 'update_school_class_dto.dart';

abstract class SchoolClassDTO with FormDTO {
  final TextEditingController nameController;
  final EditingController<String> levelController;
  final EditingController<PdfDTO> planingController;
  final ListEditingController<TeachingAssignmentDTO>
  teachingAssignments;

  SchoolClassDTO({
    required this.nameController,
    required this.levelController,
    required this.planingController,
    required this.teachingAssignments,
  });

  @override
  void dispose() {
    nameController.dispose();
    levelController.dispose();
    planingController.dispose();

    for (var assignment in teachingAssignments.value) {
      assignment.dispose();
    }

    teachingAssignments.dispose();
  }
}
