import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';

class ParentsFilter extends PaginationDto {
  final EditingController<String> studentId;
  ParentsFilter({
    super.page,
    super.limit,
    super.keyword,
    super.fields,
    super.sort,
    String? studentId,
  }) : studentId = EditingController<String>(studentId);

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();

    if (studentId.value?.isNotEmpty ?? false) {
      json['studentId'] = studentId.value;
    }

    return json;
  }
}
