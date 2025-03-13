import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/auth/data/dto/reset_password_dto.dart';
import 'package:dirasaty_admin/features/auth/data/repository/auth.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_otp_state.dart';

class CheckOtpCubit extends Cubit<CheckOtpState> {
  final AuthRepo _authRepo;
  CheckOtpCubit(OtpDTO dto)
    : _authRepo = locator(),
      super(CheckOtpState.initial(dto));

  OtpDTO get dto => state._dto;

  void submit() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    final result = await _authRepo.checkResetCode(dto);

    result.when(
      success: (_) => emit(state._success()),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void resendOtp() async {
    if (state.isLoading) return;

    emit(state._loading());

    final result = await _authRepo.resendOtp(dto);

    result.when(
      success: (_) => emit(state._success()),
      error: (error) => emit(state._error(error.message)),
    );
  }

  @override
  Future<void> close() {
    dto.dispose();
    return super.close();
  }
}
