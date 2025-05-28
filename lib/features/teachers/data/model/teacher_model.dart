import 'package:dirasaty_admin/core/shared/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher_model.g.dart';

@JsonSerializable(createToJson: false)
class TeacherModel extends UserModel {
  final List<String>? subjects;
  final DateTime? birthDate;
  final String? gender;
  final String? phone;
  final String? address;
  final String? planning;

  const TeacherModel({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    this.planning,
    this.address,
    this.birthDate,
    this.gender,
    this.phone,
    this.subjects,
  });

  String get fullName => "$firstName $lastName";

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);
}
