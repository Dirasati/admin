import 'package:dirasaty_admin/core/router/router.dart';
import 'package:dirasaty_admin/features/auth/data/dto/reset_password_dto.dart';
import 'package:dirasaty_admin/features/auth/modules/checkotp/logic/check_otp_cubit.dart';
import 'package:dirasaty_admin/features/auth/modules/checkotp/ui/check_otp_screen.dart';
import 'package:dirasaty_admin/features/auth/modules/forgotpassword/logic/forgot_password_cubit.dart';
import 'package:dirasaty_admin/features/auth/modules/forgotpassword/ui/forgot_password_screen.dart';
import 'package:dirasaty_admin/features/auth/modules/login/logic/login.cubit.dart';
import 'package:dirasaty_admin/features/auth/modules/login/ui/login_screen.dart';
import 'package:dirasaty_admin/features/auth/modules/resetpassword/logic/reset_password_cubit.dart';
import 'package:dirasaty_admin/features/auth/modules/resetpassword/ui/reset_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthNavigator extends AppNavigatorBase {
  AuthNavigator.login() : super(path: AppRoutes.login);

  AuthNavigator.forgetPassword()
    : super(path: AppRoutes.forgetPassword);

  AuthNavigator.checkOtp(String email)
    : super(path: AppRoutes.checkOtp, queryParams: {'email': email});

  AuthNavigator.resetPassword(String email, String otp)
    : super(
        path: AppRoutes.resetPassword,
        queryParams: {'email': email, 'otp': otp},
      );

  static List<RouteBase> routes = [
    // Login Screen
    GoRoute(
      path: '/login',
      name: AppRoutes.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginScreen(),
          ),
    ),

    // Forget Password Screen
    GoRoute(
      path: '/forget-password',
      name: AppRoutes.forgetPassword,
      builder:
          (context, state) => BlocProvider(
            create: (context) => ForgotPasswordCubit(),
            child: ForgotPasswordScreen(),
          ),
    ),

    // Check OTP Screen
    GoRoute(
      path: '/check-otp',
      name: AppRoutes.checkOtp,
      builder: (context, state) {
        final email = state.uri.queryParameters['email'] ?? '';
        return BlocProvider(
          create: (context) => CheckOtpCubit(OtpDTO(email: email)),
          child: CheckOtpScreen(),
        );
      },
    ),

    // Reset Password Screen
    GoRoute(
      path: '/reset-password',
      name: AppRoutes.resetPassword,
      builder: (context, state) {
        final email = state.uri.queryParameters['email'] ?? '';
        final otp = state.uri.queryParameters['otp'] ?? '';
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => ResetPasswordCubit(
                    NewPasswordDTO(email: email, otp: otp),
                  ),
            ),
            BlocProvider(
              create:
                  (context) => CheckOtpCubit(OtpDTO(email: email)),
            ),
          ],
          child: ResetPasswordScreen(),
        );
      },
    ),
  ];
}
