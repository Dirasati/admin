import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/absence/data/model/absence_model.dart';
import 'package:dirasaty_admin/features/absence/data/repository/absence_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'justification_state.dart';

class JustificationCubit extends Cubit<JustificationState> {
  final _repo = locator<AbsenceRepo>();

  final String _absenceId;

  JustificationCubit(this._absenceId)
    : super(JustificationState.initial()) {
    loadJustification();
  }

  bool get isLoading => state._status == _JustificationStatus.loading;
  bool get isLoaded => state._absence != null;

  AbsenceModel get absence => state._absence!;

  void loadJustification() async {
    emit(state._loading());

    final result = await _repo.getAbsence(_absenceId);

    result.when(
      success: (absence) => emit(state._loaded(absence)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
