import 'package:dirasaty_admin/core/shared/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_model.g.dart';

@JsonSerializable(createToJson: false)
class ParentModel extends UserModel {
  const ParentModel({
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    this.phone,
    this.address,
    this.gender,
  });

  final String? phone;
  final String? address;
  final String? gender;

  String get name => '$firstName $lastName';

  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      _$ParentModelFromJson(json);

}
