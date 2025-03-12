// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';
part 'navigator_base.dart';

class AppRouter {
  final routerConfig = GoRouter(
    routes: [],
    debugLogDiagnostics: true,

    redirect: _handelRedirect,
  );

  static FutureOr<String?> _handelRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (AppRoutes.authPaths.contains(state.matchedLocation)) {
      return null;
    }

    // final authCubit = locator<AuthCubit>();
    // if (await authCubit.isAuthenticated) return null; //TODO check if user is authenticated
    return '/login';
  }
}
