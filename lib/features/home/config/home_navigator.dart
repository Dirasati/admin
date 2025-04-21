import 'package:dirasaty_admin/features/home/ui/home_screen.dart';
import 'package:dirasaty_admin/features/schoolclass/config/school_class_navigator.dart';
import 'package:dirasaty_admin/features/students/config/student_navigator.dart';
import 'package:go_router/go_router.dart';

class HomeNavigator {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(body: child),
      routes: [
        ...StudentNavigator.routes,
        ...SchoolClassNavigator.routes,
      ],
    ),
  ];
}
