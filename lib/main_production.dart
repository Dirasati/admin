import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dirasaty_admin/app.dart';
import 'package:dirasaty_admin/core/di/locator.dart';

void main() async {
  // Define the flavor
  FlavorConfig(
    name: "PRODUCTION",
    variables: {"baseUrl": "https://mazad.rechidiahmed.me/api/v1"},
  );

  // Initialize the ScreenUtil
  WidgetsFlutterBinding.ensureInitialized();

  // Setup the dependency injection
  await setupLocator();

  // Ensure the screen size is set
  await ScreenUtil.ensureScreenSize();

  runApp(const DirassatyApp());
}
