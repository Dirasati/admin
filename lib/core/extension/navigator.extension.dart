import 'package:dirasaty_admin/core/router/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigatorExtension on BuildContext {
  void to(AppNavigatorBase route) =>
      kIsWeb ? off(route) : push(route.path);

  Future<void> toWith<T>(
    AppNavigatorBase route, {
    required ValueChanged<T> onResult,
    VoidCallback? onError,
  }) async {
    final result = await push<T>(route.path);
    result != null ? onResult(result) : onError?.call();
  }

  void off(AppNavigatorBase route) => go(route.path);

  void offAll(AppNavigatorBase route) {
    go(route.path);
  }

  void back<T>([T? result]) => Navigator.of(this).pop(result);

  void refresh() => GoRouter.of(
    this,
  ).pushReplacement(GoRouter.of(this).state.matchedLocation);
}
