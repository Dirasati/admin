// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dirasaty_admin/core/services/cloudstorage/cloud_storage.service.dart'
    as _i961;
import 'package:dirasaty_admin/core/services/cloudstorage/cloudinary.service.dart'
    as _i480;
import 'package:dirasaty_admin/core/services/filepicker/file_picker_service.dart'
    as _i118;
import 'package:dirasaty_admin/features/absence/data/repository/absence_repository.dart'
    as _i169;
import 'package:dirasaty_admin/features/absence/data/source/absence_api.dart'
    as _i743;
import 'package:dirasaty_admin/features/admins/data/repository/admins_repository.dart'
    as _i974;
import 'package:dirasaty_admin/features/admins/data/source/admins_api.dart'
    as _i77;
import 'package:dirasaty_admin/features/schoolclass/data/repository/school_class_repository.dart'
    as _i518;
import 'package:dirasaty_admin/features/schoolclass/data/source/school_class_api.dart'
    as _i542;
import 'package:dirasaty_admin/features/subject/data/repository/subject_repository.dart'
    as _i533;
import 'package:dirasaty_admin/features/subject/data/source/subject_api.dart'
    as _i325;
import 'package:dirasaty_admin/features/teachers/data/repository/teachers_repository.dart'
    as _i305;
import 'package:dirasaty_admin/features/teachers/data/source/teachers_api.dart'
    as _i213;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i518.SchoolClassRepo>(() => _i518.SchoolClassRepo());
    gh.lazySingleton<_i169.AbsenceRepo>(() => _i169.AbsenceRepo());
    gh.lazySingleton<_i533.SubjectRepo>(() => _i533.SubjectRepo());
    gh.lazySingleton<_i305.TeachersRepo>(() => _i305.TeachersRepo());
    gh.lazySingleton<_i118.PdfPickerService>(() => _i118.PdfPickerService());
    gh.lazySingleton<_i974.AdminsRepo>(() => _i974.AdminsRepo());
    gh.lazySingleton<_i542.SchoolClassApi>(
      () => _i542.SchoolClassApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i743.AbsenceApi>(() => _i743.AbsenceApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i325.SubjectApi>(() => _i325.SubjectApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i213.TeachersApi>(
      () => _i213.TeachersApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i77.AdminsApi>(() => _i77.AdminsApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i961.PdfCloudStorageService>(
      () => _i480.PdfCloudinaryService(),
    );
    gh.lazySingleton<_i961.ImageCloudStorageService>(
      () => _i480.ImageCloudinaryService(),
    );
    return this;
  }
}
