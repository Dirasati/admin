import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/absence/data/dto/absence_filter.dart';
import 'package:dirasaty_admin/features/absence/data/model/absence_model.dart';
import 'package:dirasaty_admin/features/absence/data/repository/absence_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'absences_state.dart';

class AbsencesCubit extends Cubit<AbsencesState> {
  final _repository = locator<AbsenceRepo>();
  final _paginationDto = AbsenceFilterDTO();

  AbsencesCubit() : super(AbsencesState.initial());

  List<AbsenceModel> get absence => state._result?.data ?? [];

  Pagination get pagination =>
      state._result?.pagination ?? const Pagination();

  bool get isLoading => state._status == _AbsencesStatus.loading;

  PaginationDto get filter => _paginationDto;

  void firstPage() {
    _paginationDto.firstPage();
    state._result?.clear();
    fetchAbsencees();
  }

  void nextPage() {
    if (pagination.next != null) fetchAbsencees();
  }

  void previousPage() {
    if (pagination.prev != null) {
      _paginationDto.prevPage();
      fetchAbsencees();
    }
  }

  void fetchAbsencees() async {
    emit(state._loading());

    final response = await _repository.getAbsences(_paginationDto);

    response.when(
      success: (result) {
        if (result.data.isNotEmpty) _paginationDto.nextPage();

        emit(state._loaded(result));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  void markAbsenceJustified(AbsenceModel absence) async {
    emit(state._loadingAbsence(absence));

    final response = await _repository.markAsJustified(absence);

    response.when(
      success: (result) => emit(state._replaceAbsence(result)),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void markAbsenceUnjustified(AbsenceModel absence) async {
    emit(state._loadingAbsence(absence));

    final response = await _repository.markAsUnjustified(absence);

    response.when(
      success: (result) => emit(state._replaceAbsence(result)),
      error: (error) => emit(state._error(error.message)),
    );
  }


}
