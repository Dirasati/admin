import 'package:dirasaty_admin/features/auth/config/auth_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:dirasaty_admin/core/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dirasaty_admin/core/services/cache/cache.service.dart';
import 'package:dirasaty_admin/core/services/cloudstorage/cloud_storage.service.dart';
import 'package:dirasaty_admin/core/services/cloudstorage/cloudinary.service.dart';
import 'package:dirasaty_admin/core/services/dio/dio.service.dart';
import 'package:dirasaty_admin/core/services/filepicker/filepick.service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedpref = await SharedPreferences.getInstance();
  // SharedPreferences and FlutterSecureStorage
  locator.registerLazySingleton(() => sharedpref);
  locator.registerLazySingleton(() => FlutterSecureStorage());

  //CacheService
  locator.registerLazySingleton(() => CacheService());

  //Dio
  locator.registerLazySingleton(() => DioService.getDio());

  //Router
  locator.registerSingleton(AppRouter());

  //File Picker
  locator.registerLazySingleton<ImagePickerService>(
    () => kIsWeb ? WebFilePicker() : MobileFilePicker(),
  );

  //Cloud storage service
  locator.registerLazySingleton<ImageCloudStorageService>(
    () => CloudinaryService(),
  );

  // Features dependencies
  AuthDependency.init();

  locator.allowReassignment = true;
}
