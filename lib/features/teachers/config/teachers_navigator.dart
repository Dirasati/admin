import 'package:dirasaty_admin/features/teachers/modules/teachers/logic/teachers_cubit.dart';
import 'package:dirasaty_admin/features/teachers/modules/teachers/ui/teachers_screen.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TeachersNavigator extends AppNavigatorBase {
  TeachersNavigator._({required super.path});

  factory TeachersNavigator.teachers() {
    return TeachersNavigator._(path: AppRoutes.teachers);
  }

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.teachers,
      builder:
          (context, state) => BlocProvider(
            create: (_) => TeachersCubit()..getTeachers(),
            child: const TeachersScreen(),
          ),
    ),
  ];
}
