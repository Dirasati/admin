import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

@JsonSerializable(createToJson: false)
class SubjectModel extends Equatable {
  final String? id;
  final String? name;
  final String? level;
  final int? coefficient;
  final bool? isMain;

  const SubjectModel({
    this.id,
    this.name,
    this.level,
    this.coefficient,
    this.isMain,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
