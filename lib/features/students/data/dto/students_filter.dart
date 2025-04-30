import 'package:dirasaty_admin/core/extension/map.extension.dart';
import 'package:dirasaty_admin/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';

class StudentsFilter extends PaginationDto {
  final EditingController<String> level;
  final EditingController<bool> isAbsent;
  final EditingController<String> gender;
  final EditingController<DateTime> birthDate;

  StudentsFilter({
    super.page,
    super.limit,
    super.keyword,
    super.fields,
    super.sort,
    String? level,
    bool? isAbsent,
    String? gender,
    DateTime? birthDate,
  }) : level = EditingController(level),
       isAbsent = EditingController(isAbsent),
       gender = EditingController(gender),
       birthDate = EditingController(birthDate);

  @override
  Map<String, dynamic> toJson() =>
      {
        ...super.toJson(),
        'level': level.value,
        'isAbsent': isAbsent.value,
        'gender': gender.value,
        'birthDate': birthDate.value?.toIso8601String(),
      }.withoutNullsOrEmpty();
}
