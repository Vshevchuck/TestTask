import 'package:injectable/injectable.dart';

import '../../router/app_auto_router.dart';

@module
abstract class AutoRouterModule {
  @singleton
  AppAutoRouter appAutoRouter() => AppAutoRouter();
}
