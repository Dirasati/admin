import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dirasaty_admin/app.dart';
import 'package:dirasaty_admin/core/di/locator.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  // Define the flavor
  FlavorConfig(
    name: "PRODUCTION",
    variables: {"baseUrl": "https://dirassaty.rechidiahmed.me/api/v1"},
  );

  // Initialize the ScreenUtil
  WidgetsFlutterBinding.ensureInitialized();

  // Enable path-based URLs
  setUrlStrategy(PathUrlStrategy());

  // Setup the dependency injection
  await setupLocator();

  // Ensure the screen size is set
  await ScreenUtil.ensureScreenSize();

  runApp(const DirassatyApp());
}
