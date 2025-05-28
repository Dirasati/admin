import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/form_dto.dart';
import 'package:dirasaty_admin/features/parent/data/models/parent_model.dart';
import 'package:dirasaty_admin/features/payment/data/models/payment_model.dart';
import 'package:dirasaty_admin/features/payment/data/models/tuition_fee_model.dart';
import 'package:flutter/widgets.dart';

class PaymentDto with FormDTO {
  final PaymentModel? _payment;

  final EditingController<TuitionFeeModel> tuitionFeeController;
  final EditingController<ParentModel> parentController;
  final TextEditingController amountController;

  PaymentDto([this._payment])
    : tuitionFeeController = EditingController<TuitionFeeModel>(
        _payment?.tuitionFee ?? TuitionFeeModel(),
      ),
      parentController = EditingController<ParentModel>(
        _payment?.parent ?? ParentModel(),
      ),
      amountController = TextEditingController(
        text: _payment?.amount?.toString() ?? '',
      );

  @override
  void dispose() {
    tuitionFeeController.dispose();
    parentController.dispose();
    amountController.dispose();
  }

  String get id => _payment!.id!;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return _payment != null
        ? {
          if (_payment.tuitionFee != tuitionFeeController.value)
            'tuitionFeeId': tuitionFeeController.value?.id,

          if (_payment.parent != parentController.value)
            'parentId': parentController.value?.id,

          if (_payment.amount != int.tryParse(amountController.text))
            'amount': int.tryParse(amountController.text),
        }
        : {
          'tuitionFeeId': tuitionFeeController.value?.id,
          'parentId': parentController.value?.id,
          'amount': int.tryParse(amountController.text),
        };
  }
}
