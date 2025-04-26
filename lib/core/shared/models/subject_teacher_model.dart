import 'package:dirasaty_admin/features/subject/data/model/subject_model.dart';
import 'package:dirasaty_admin/features/teachers/data/model/teacher_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_teacher_model.g.dart';

@JsonSerializable(createToJson: false)
class SubjectTeacherModel extends Equatable {
  final TeacherModel? teacher;
  final SubjectModel? subject;

  const SubjectTeacherModel({this.teacher, this.subject});


  factory SubjectTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectTeacherModelFromJson(json);

  @override
  List<Object?> get props => [subject];
}
