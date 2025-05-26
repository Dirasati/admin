import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';

class PaymentsFilterDto extends PaginationDto {
  final EditingController<String> tuitionFeeIdController;

  PaymentsFilterDto({
    super.page,
    super.limit,
    super.keyword,
    super.fields,
    super.sort,
    String? tuitionFeeId,
  }) : tuitionFeeIdController = EditingController<String>(
         tuitionFeeId,
       );
}
