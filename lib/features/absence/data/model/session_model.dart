import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionModel extends Equatable {
  final String? id;
  final TeacherModel? teacher;
  final DateTime? date;
  final int? period;


  const SessionModel({
    this.id,
    this.teacher,
    this.date,
    this.period,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
