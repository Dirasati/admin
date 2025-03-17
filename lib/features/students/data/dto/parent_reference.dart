part of 'student_dto.dart';

class ParentReferenceDTO {
  final TextEditingController parentIDController;
  final EditingController<String> parentRelationController;

  ParentReferenceDTO()
    : parentIDController = TextEditingController(),
      parentRelationController = EditingController();

  ParentReferenceDTO.fromModel(ParentReferenceModel model)
    : parentIDController = TextEditingController(text: model.parent),
      parentRelationController = EditingController(
        model.relationship,
      );

  bool isModified(ParentReferenceModel model) {
    return model.parent != parentIDController.text ||
        model.relationship != parentRelationController.value;
  }

  void dispose() {
    parentIDController.dispose();
    parentRelationController.dispose();
  }

  Future<Map<String, dynamic>> toMap() async {
    return {
      'parent': parentIDController.text,
      'relationship': parentRelationController.value,
    };
  }

  String? validateParentID(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'FieldIsRequired'.tr(context);
    }
    return null;
  }

  String? validateParentRelation(
    String? value,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return 'FieldIsRequired'.tr(context);
    }
    return null;
  }
}
