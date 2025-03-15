import 'package:dirasaty_admin/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:flutter/widgets.dart';

class StudentsFilter extends PaginationDto {
  final TextEditingController level;
  final BooleanEditingController isAbsent;

  StudentsFilter({
    super.page,
    super.limit,
    super.keyword,
    super.fields,
    super.sort,
    String? level,
    bool isAbsent = false,
  }) : level = TextEditingController(text: level),
       isAbsent = BooleanEditingController(isAbsent);

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    if (level.text.isNotEmpty) 'level': level.text,
    if (isAbsent.value) 'isAbsent': isAbsent.value,
  };
}
