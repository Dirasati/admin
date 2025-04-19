import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_model.g.dart';

@JsonSerializable(createToJson: false)
class ParentModel extends Equatable {
  const ParentModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      _$ParentModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
