import 'package:dirasaty_admin/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../modules/absences/logic/absences_cubit.dart';
import '../modules/absences/ui/absences_screen.dart';

class AbsenceNavigator extends AppNavigatorBase {
  AbsenceNavigator.absences() : super(path: AppRoutes.absences);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.absences,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AbsencesCubit()..fetchAbsencees(),
          child: const AbsencesScreen(),
        );
      },
    ),
  ];
}
