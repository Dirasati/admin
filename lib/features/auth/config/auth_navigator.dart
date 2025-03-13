import 'package:dirasaty_admin/core/router/router.dart';
import 'package:dirasaty_admin/features/auth/modules/login/logic/login.cubit.dart';
import 'package:dirasaty_admin/features/auth/modules/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthNavigator extends AppNavigatorBase {
  AuthNavigator.login() : super(name: AppRoutes.login);

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
  ];
}
