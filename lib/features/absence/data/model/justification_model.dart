import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'justification_model.g.dart';

@JsonSerializable(createToJson: false)
class JustificationModel extends Equatable {
  final String? id;
  final ParentModel? parent;
  final String? content;
  final List<String>? attachments;
  final String? status;

  const JustificationModel({
    this.id,
    this.parent,
    this.content,
    this.attachments,
    this.status,
  });

  bool get canAccept => status == "Pending";

  factory JustificationModel.fromJson(Map<String, dynamic> json) =>
      _$JustificationModelFromJson(json);

  @override
  List<Object?> get props => [id];
}