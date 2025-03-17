import 'package:dirasaty_admin/features/parent/config/parent_navigator.dart';
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/features/auth/config/auth_navigator.dart';
import 'package:dirasaty_admin/features/auth/logic/auth.cubit.dart';
import 'package:dirasaty_admin/features/home/config/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';
part 'navigator_base.dart';

class AppRouter {
  final routerConfig = GoRouter(
    initialLocation: '/login', //TODO change to home
    routes: [...ParentNavigator.routes,   ...AuthNavigator.routes, ...HomeNavigator.routes],
    debugLogDiagnostics: true,

    redirect: _handelRedirect,
  );

  static FutureOr<String?> _handelRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    return null; //TODO remove after adding auth

    if (AppRoutes._authPaths.any(
      (path) => state.matchedLocation.contains(path),
    )) {
      return null;
    }

    if (await locator<AuthCubit>().isAuthenticated) {
      return null;
    }

    return '/login';
  }
}
