import 'package:json_annotation/json_annotation.dart';

part 'parent_reference_model.g.dart';

@JsonSerializable(createToJson: false)
class ParentReferenceModel {
  const ParentReferenceModel({this.parent, this.relationship});

  final String? parent;
  final String? relationship;

  factory ParentReferenceModel.fromJson(Map<String, dynamic> json) =>
      _$ParentReferenceModelFromJson(json);
}
