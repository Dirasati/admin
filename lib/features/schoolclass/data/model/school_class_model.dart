import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_class_model.g.dart';

@JsonSerializable(createToJson: false)
class SchoolClassModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? level;
  final int? nbOfStudents;
  final int? nbOfTeachers;

  const SchoolClassModel({
    this.id,
    this.name,
    this.level,
    this.nbOfStudents,
    this.nbOfTeachers,
  });

  factory SchoolClassModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolClassModelFromJson(json);

  @override
  List<Object?> get props => [];
}
