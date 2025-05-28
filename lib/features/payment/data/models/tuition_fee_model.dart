import 'package:dirasaty_admin/features/students/data/model/student_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tuition_fee_model.g.dart';

@JsonSerializable(createToJson: false)
class TuitionFeeModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final StudentModel? student;
  final int? amount;
  final int? paidAmount;
  final String? paymentMode;
  final DateTime? nextPaymentDate;
  final int? nextPaymentAmount;

  const TuitionFeeModel({
    this.id,
    this.student,
    this.amount,
    this.paymentMode,
    this.nextPaymentDate,
    this.nextPaymentAmount,
    this.paidAmount,
  });

  factory TuitionFeeModel.fromJson(Map<String, dynamic> json) =>
      _$TuitionFeeModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
