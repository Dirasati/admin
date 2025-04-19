import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';

class ParentsFilter extends PaginationDto {
  ParentsFilter({
    super.page,
    super.limit,
    super.keyword,
    super.fields,
    super.sort,
  });
}
