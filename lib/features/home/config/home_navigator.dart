import 'package:dirasaty_admin/features/home/ui/home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeNavigator {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(body: child),
      routes: [
        //TODO add home routes
      ],
    ),
  ];
}
