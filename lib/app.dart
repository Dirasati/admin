import 'package:dirasaty_admin/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dirasaty_admin/core/localization/localization_cubit.dart';

import 'core/di/locator.dart';
import 'core/localization/app_localization.dart';
import 'core/router/router.dart';

class DirassatyApp extends StatelessWidget {
  const DirassatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      builder: (_, __) {
        return BlocProvider(
          create: (context) => LocalizationCubit(),
          child: _MaterialApp(),
        );
      },
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();

    final local = context.watch<LocalizationCubit>().state;

    return MaterialApp.router(
      routerConfig: router.routerConfig,
      theme: ThemeData(fontFamily: FontFamily.poppins),
      supportedLocales: [
        Locale('fr'), // French
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: local,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null &&
            supportedLocales.any(
              (element) =>
                  element.languageCode == locale.languageCode,
            )) {
          return locale;
        }
        // If the current device locale is not supported, use the first one
        return supportedLocales.first;
      },
    );
  }
}
