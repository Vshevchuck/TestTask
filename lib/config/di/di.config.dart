// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

import '../../api/api_module.dart' as _i963;
import '../../api/interceptors/header_api_interceptor.dart' as _i910;
import '../../api/vinchesta_api_client.dart' as _i626;
import '../../cubit/main_page_cubit/main_page_cubit.dart' as _i621;
import '../../services/map_service.dart' as _i776;
import '../../services/preference_service.dart' as _i466;
import '../router/app_auto_router.dart' as _i425;
import '../router/vinchesta_router.dart' as _i396;
import 'modules/auto_router_module.dart' as _i448;
import 'modules/logger_module.dart' as _i205;
import 'modules/package_info_module.dart' as _i719;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $configureDependencies(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final autoRouterModule = _$AutoRouterModule();
  final loggerModule = _$LoggerModule();
  final packageInfoModule = _$PackageInfoModule();
  final apiModule = _$ApiModule();
  await gh.factoryAsync<_i466.PreferencesService>(
    () => _i466.PreferencesService.getInstance(),
    preResolve: true,
  );
  gh.singleton<_i425.AppAutoRouter>(() => autoRouterModule.appAutoRouter());
  gh.singleton<_i974.Logger>(() => loggerModule.logger());
  await gh.singletonAsync<_i655.PackageInfo>(
    () => packageInfoModule.packageInfo(),
    preResolve: true,
  );
  gh.factory<_i910.HeaderApiInterceptor>(
      () => _i910.HeaderApiInterceptor(gh<_i466.PreferencesService>()));
  gh.lazySingleton<_i361.Dio>(
    () => apiModule.generalDio(gh<_i910.HeaderApiInterceptor>()),
    instanceName: 'GeneralApi',
  );
  gh.lazySingleton<_i626.VinchestaApiClient>(
      () => apiModule.apiClient(gh<_i361.Dio>(instanceName: 'GeneralApi')));
  gh.singleton<_i396.VinchestaRouter>(
      () => _i396.VinchestaRouter(gh<_i425.AppAutoRouter>()));
  gh.lazySingleton<_i361.Dio>(
    () => apiModule.vimeoDio(),
    instanceName: 'VimeoApi',
  );
  gh.factory<_i776.MapService>(
      () => _i776.MapService(gh<_i626.VinchestaApiClient>()));
  gh.factory<_i621.MainPageCubit>(
      () => _i621.MainPageCubit(gh<_i776.MapService>()));
  return getIt;
}

class _$AutoRouterModule extends _i448.AutoRouterModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$PackageInfoModule extends _i719.PackageInfoModule {}

class _$ApiModule extends _i963.ApiModule {}
