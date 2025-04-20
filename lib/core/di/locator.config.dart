// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dirasaty_admin/features/schoolclass/data/repository/school_class_repository.dart'
    as _i518;
import 'package:dirasaty_admin/features/schoolclass/data/source/school_class_api.dart'
    as _i542;
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
    gh.lazySingleton<_i542.SchoolClassApi>(
      () => _i542.SchoolClassApi(gh<_i361.Dio>()),
    );
    return this;
  }
}
