import 'package:dirasaty_admin/core/shared/models/subject_teacher_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_class_model.g.dart';

@JsonSerializable(createToJson: false)
class SchoolClassModel extends Equatable {
  final String? id;
  final String? name;
  final String? level;
  final String? planning;
  final int? nbOfStudents;
  final int? nbOfTeachers;
  final List<SubjectTeacherModel>? teachingAssignments;

  const SchoolClassModel({
    this.id,
    this.name,
    this.level,
    this.nbOfStudents,
    this.nbOfTeachers,
    this.teachingAssignments,
    this.planning,
  });

  factory SchoolClassModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolClassModelFromJson(json);

  @override
  List<Object?> get props => [];
}
