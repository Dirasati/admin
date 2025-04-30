import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_reference_model.dart';
import 'package:equatable/equatable.dart';

class ParentReferenceDTO extends Equatable {
  final EditingController<ParentModel> parentController;
  final EditingController<String> parentRelationController;

  ParentReferenceDTO(ParentModel parent)
    : parentController = EditingController(parent),
      parentRelationController = EditingController();

  ParentReferenceDTO.fromModel(ParentReferenceModel model)
    : parentController = EditingController(model.parent),
      parentRelationController = EditingController(
        model.relationship,
      );

  bool isModified(ParentReferenceModel model) {
    return model.relationship != parentRelationController.value ||
        model.parent != parentController.value;
  }

  void dispose() {
    parentController.dispose();
    parentRelationController.dispose();
  }

  Future<Map<String, dynamic>> toMap() async {
    return {
      'parent': parentController.value?.id,
      'relationship': parentRelationController.value,
    }.withoutNullsOrEmpty();
  }

  @override
  List<Object?> get props => [parentController.value];
}
