import 'package:dirasaty_admin/core/router/router.dart';
import 'package:dirasaty_admin/features/parent/data/dto/parents_filter.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/logic/multi_parent_cubit.dart';
import 'package:dirasaty_admin/features/parent/modules/multiparent/ui/parents_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ParentNavigator extends AppNavigatorBase {
  ParentNavigator.parents() : super(path: AppRoutes.parents);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.parents,
      builder:
          (context, state) => BlocProvider(
            create:
                (_) => MultiParentCubit(ParentsFilter())..firstPage(),
            child: ParentsScreen(),
          ),
    ),
  ];
}
