import 'package:dirasaty_admin/features/admins/modules/admins/logic/admins_cubit.dart';
import 'package:dirasaty_admin/features/admins/modules/admins/ui/admins_screen.dart';
import 'package:flutter/material.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminsNavigator extends AppNavigatorBase {
  AdminsNavigator._({required super.path});

  factory AdminsNavigator.admins() {
    return AdminsNavigator._(path: AppRoutes.admins);
  }

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.admins,
      builder: (context, state) => BlocProvider(
        create: (_) => AdminsCubit()..getAdmins(),
        child: const AdminsScreen(),
      ),
    ),
  ];
}
