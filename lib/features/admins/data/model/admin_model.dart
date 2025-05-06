import 'package:dirasaty_admin/core/shared/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_model.g.dart';

@JsonSerializable(createToJson: false)
class AdminModel extends UserModel {
  final String? phone;
  final String? address;
  final String? gender;

  const AdminModel({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    this.address,
    this.phone,
    this.gender,
  });

  String get fullName => "$firstName $lastName";

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
