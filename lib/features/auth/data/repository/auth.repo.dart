import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/repo_base.dart';
import 'package:dirasaty_admin/features/auth/data/dto/login.dto.dart';
import 'package:dirasaty_admin/features/auth/data/dto/signup.dto.dart';
import 'package:dirasaty_admin/features/auth/data/dto/reset_password_dto.dart';
import 'package:dirasaty_admin/features/auth/data/source/auth.api.dart';

class AuthRepo extends NetworkRepository {
  final _authApi = locator<AuthApi>();

  RepoResult<AuthTokens> login(LoginDTO dto) async {
    return tryApiCall(() async {
      final response = await _authApi.login(await dto.toMap());
      return response.tokens!;
    });
  }

  RepoResult<AuthTokens> signup(SignupDTO dto) async {
    return tryApiCall(() async {
      final response = await _authApi.register(await dto.toMap());
      return response.tokens!;
    });
  }

  RepoResult<AuthTokens> refreshToken(String refreshToken) async {
    return tryApiCall(() async {
      final response = await _authApi.refreshToken(refreshToken);
      return response.tokens!;
    });
  }

  RepoResult<void> forgotPassword(ForgotPasswordDto dto) async =>
      tryApiCall(
        () async => await _authApi.forgotPassword(await dto.toMap()),
      );

  RepoResult<void> resendOtp(OtpDTO dto) async => tryApiCall(
    () async => await _authApi.forgotPassword(dto.toResendMap()),
  );

  RepoResult<void> checkResetCode(OtpDTO dto) async => tryApiCall(
    () async => await _authApi.checkResetCode(await dto.toMap()),
  );

  RepoResult<AuthTokens> resetPassword(NewPasswordDTO dto) async {
    return tryApiCall(() async {
      final response = await _authApi.resetPassword(
        await dto.toMap(),
      );
      return response.tokens!;
    });
  }
}
