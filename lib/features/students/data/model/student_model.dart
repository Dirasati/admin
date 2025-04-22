import 'package:dirasaty_admin/features/parent/data/models/parent_reference_model.dart';
import 'package:dirasaty_admin/core/shared/models/user_model.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable(createToJson: false)
class StudentModel extends UserModel {
  const StudentModel({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    this.parentsReferences,
    this.schoolClass,
    this.code,
    this.level,
    this.isAbsent,
    this.birthDate,
    this.inscriptionDate,
    this.address,
    this.gender,
    this.phone,
  });

  @JsonKey(name: 'class')
  final SchoolClassModel? schoolClass;
  final String? code;
  final String? level;
  final DateTime? birthDate;
  final DateTime? inscriptionDate;
  final String? gender;
  final String? phone;
  final String? address;
  final bool? isAbsent;
  final List<ParentReferenceModel>? parentsReferences;

  String get fullName {
    return '$firstName $lastName';
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
