import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'justification_model.dart';
import 'session_model.dart';

part 'absence_model.g.dart';

@JsonSerializable(createToJson: false)
class AbsenceModel extends Equatable {
  final String? id;
  final StudentModel? student;
  final bool? isJustified;
  final bool? hasJustification;
  final JustificationModel? justification;
  final DateTime? absentSince;
  final String? subjectName;
  final List<SessionModel>? causingSessions;

  const AbsenceModel({
    this.id,
    this.student,
    this.isJustified,
    this.justification,
    this.absentSince,
    this.subjectName,
    this.causingSessions,
    this.hasJustification,
  });

  factory AbsenceModel.fromJson(Map<String, dynamic> json) =>
      _$AbsenceModelFromJson(json);

  @override
  List<Object?> get props => [id];
}

