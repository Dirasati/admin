import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';

import '../data/repository/auth.repo.dart';
import '../data/source/auth.cache.dart';

part 'auth.state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authRepo = locator<AuthRepo>();
  final _authCache = locator<AuthCache>();

  AuthCubit() : super(AuthState.initial());

  Future<bool> get isAuthenticated async =>
      await _authCache.isAuthenticated;

  void checkAuth() async {
    await isAuthenticated
        ? emit(state._authenticated())
        : emit(state._unauthenticated());
  }

  void authenticate(AuthTokens tokens) async {
    await _authCache.setTokens(tokens);
    emit(state._authenticated());
  }

  Future<bool> refreshToken() async {
    emit(state._loading());

    final refreshToken = await _authCache.refreshToken;

    if (refreshToken == null) {
      logout();
      return false;
    }

    final result = await _authRepo.refreshToken(refreshToken);
    
   return result.when(
      success: (tokens) {
        authenticate(tokens);
        return true;
      },
      error: (error) {
        emit(state._error(error.message));
        logout();
        return false;

      },
    );


  }

  void logout() async {
    emit(state._unauthenticated());
    await _authCache.clearTokens();

    locator<AppRouter>().routerConfig.goNamed(AppRoutes.login);
  }
}
