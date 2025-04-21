import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/extension/list.extension.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/schoolclass/data/model/school_class_model.dart';
import 'package:dirasaty_admin/features/schoolclass/data/repository/school_class_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'school_classes_state.dart';

class SchoolClassesCubit extends Cubit<SchoolClassesState> {
  final _repository = locator<SchoolClassRepo>();
  final _paginationDto = PaginationDto();

  SchoolClassesCubit() : super(SchoolClassesState.initial());

  List<SchoolClassModel> get classes => state._result?.data ?? [];
  Pagination get pagination =>
      state._result?.pagination ?? const Pagination();

  bool get isLoading => state._status == _SchoolClassesStatus.loading;

  PaginationDto get filter => _paginationDto;

  void firstPage() {
    _paginationDto.firstPage();
    state._result?.clear();
    fetchClasses();
  }

  void nextPage() {
    if (pagination.next != null) fetchClasses();
  }

  void previousPage() {
    if (pagination.prev != null) {
      _paginationDto.prevPage();
      fetchClasses();
    }
  }

  void fetchClasses() async {
    emit(state._loading());

    final response = await _repository.getSchoolClasses(
      _paginationDto,
    );

    response.when(
      success: (result) {
        if (result.data.isNotEmpty) _paginationDto.nextPage();

        emit(state._loaded(result));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  void addClass(SchoolClassModel class_) =>
      emit(state._addClass(class_));

  void removeClass(SchoolClassModel class_) async {
    emit(state._loading());

    final response = await _repository.deleteSchoolClass(class_.id!);

    response.when(
      success: (_) => emit(state._removeClass(class_)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void updateClass(SchoolClassModel class_) =>
      emit(state._replaceClass(class_));
}
