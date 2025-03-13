import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/auth/data/dto/reset_password_dto.dart';
import 'package:dirasaty_admin/features/auth/data/repository/auth.repo.dart';
import 'package:dirasaty_admin/features/auth/logic/auth.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo _authRepo;

  ResetPasswordCubit( NewPasswordDTO dto)
    : _authRepo = locator(),
      super(ResetPasswordState.initial(dto));

  NewPasswordDTO get dto => state._dto;

  void submit() async {
    if (state.isLoading || !dto.validate()) return;

    emit(state._loading());

    final result = await _authRepo.resetPassword(state._dto);

    result.when(
      success: (tokens) {
        locator<AuthCubit>().authenticate(tokens);
        emit(state._success());
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  @override
  Future<void> close() {
    dto.dispose();
    return super.close();
  }
}
