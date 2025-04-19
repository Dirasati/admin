import 'package:dirasaty_admin/core/router/router.dart';
import 'package:dirasaty_admin/features/students/modules/multistudents/logic/multi_students_cubit.dart';
import 'package:dirasaty_admin/features/students/modules/multistudents/ui/students_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StudentNavigator extends AppNavigatorBase {
  StudentNavigator.students() : super(path: AppRoutes.students);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.students,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => StudentsListCubit()..firstPage(),
          child: StudentsListView(),
        );
      },
    ),
  ];
}
