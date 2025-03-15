import 'package:dirasaty_admin/core/shared/models/parent_reference_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final List<ParentReferenceModel> parentsReferences;

  const UserModel({this.id, this.name, this.email  , required this.parentsReferences});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
