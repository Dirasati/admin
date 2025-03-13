import 'package:dio/dio.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthApi;

  @POST("/auth/login")
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);

  @POST("/auth/register")
  Future<AuthResponse> register(@Body() Map<String, dynamic> body);

  @GET("/auth/refresh-token")
  Future<AuthResponse> refreshToken(
    @Query("refreshToken") String refreshToken,
  );

  @POST("/auth/forgot-password")
  Future<MessageResponse> forgotPassword(
    @Body() Map<String, dynamic> body,
  );

  @POST("/auth/check-reset-code")
  Future<MessageResponse> checkResetCode(
    @Body() Map<String, dynamic> body,
  );

  @POST("/auth/reset-password")
  Future<AuthResponse> resetPassword(
    @Body() Map<String, dynamic> body,
  );
}
