import 'package:dirasaty_admin/features/payment/tuitionfees/logic/tuition_fees_cubit.dart';
import 'package:dirasaty_admin/features/payment/tuitionfees/ui/tuition_fee_screen.dart';
import 'package:flutter/material.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentNavigator extends AppNavigatorBase {
  PaymentNavigator.tuitionFees() : super(path: AppRoutes.tuitionFees);

  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.tuitionFees,
      builder: (context, state) {
        return BlocProvider(
          lazy: false,
          create: (context) => TuitionFeesCubit()..firstPage(),
          child: const TuitionFeeScreen(),
        );
      },
    ),
  ];
}
