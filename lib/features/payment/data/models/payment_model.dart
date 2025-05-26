import 'package:dirasaty_admin/features/admins/data/model/admin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/payment/data/models/tuition_fee_model.dart';

part 'payment_model.g.dart';

@JsonSerializable(createToJson: false)
class PaymentModel extends Equatable {
  final String? id;
  final AdminModel? admin;
  final ParentModel? parent;
  final TuitionFeeModel? tuitionFee;
  final int? amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PaymentModel({
    this.id,
    this.admin,
    this.parent,
    this.tuitionFee,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  @override
  List<Object?> get props => [id];
}