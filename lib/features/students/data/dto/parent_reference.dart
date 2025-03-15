part of 'student_dto.dart';

class ParentReferenceDTO {
  final TextEditingController parentIDController;
  final TextEditingController parentRelationController;

  ParentReferenceDTO()
    : parentIDController = TextEditingController(),
      parentRelationController = TextEditingController();

  ParentReferenceDTO.fromModel(ParentReferenceModel model)
    : parentIDController = TextEditingController(text: model.parent),
      parentRelationController = TextEditingController(
        text: model.relationship,
      );

  bool isModified(ParentReferenceModel model) {
    return model.parent != parentIDController.text ||
        model.relationship != parentRelationController.text;
  }

  void dispose() {
    parentIDController.dispose();
    parentRelationController.dispose();
  }

  Future<Map<String, dynamic>> toMap() async {
    return {
      'parent': parentIDController.text,
      'relationship': parentRelationController.text,
    };
  }
}
