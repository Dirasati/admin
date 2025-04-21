import 'package:dirasaty_admin/features/schoolclass/modules/schoolclasses/logic/school_classes_cubit.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../modules/schoolclasses/ui/school_classes_screen.dart';

class SchoolClassNavigator extends AppNavigatorBase {
  SchoolClassNavigator.classes() : super(path: AppRoutes.classes);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.classes,
      name: 'CLASSES',
      builder:
          (context, state) => BlocProvider(
            create: (_) => SchoolClassesCubit()..fetchClasses(),
            child: const SchoolClassesScreen(),
          ),
    ),
  ];
}
