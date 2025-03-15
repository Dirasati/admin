import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_class_model.g.dart';

@JsonSerializable(createToJson: false)
class SchoolClassModel extends Equatable {
  //TODO add properties

  const SchoolClassModel();

  factory SchoolClassModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolClassModelFromJson(json);

  @override
  List<Object?> get props => [];
}
