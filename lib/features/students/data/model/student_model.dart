import 'package:dirasaty_admin/features/parent/data/models/parent_reference_model.dart';
import 'package:dirasaty_admin/core/shared/models/user_model.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable(createToJson: false)
class StudentModel extends UserModel {
  final SchoolClassModel? schoolClass;
  final String? code;
  final String? level;
  final bool? isAbsent;
  final List<ParentReferenceModel>? parentsReferences;

  const StudentModel({
    super.id,
    String? lastName,
    String? firstName,
    super.email,
    this.parentsReferences,
    this.schoolClass,
    this.code,
    this.level,
    this.isAbsent,
  }) : super(name: '$lastName $firstName');

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
