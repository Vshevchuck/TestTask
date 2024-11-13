import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_constants.dart';
import '../../../api/interceptors/header_api_interceptor.dart';

import 'vinchesta_api_client.dart';

@module
abstract class ApiModule {
  @lazySingleton
  @Named(ApiConstants.baseApiKey)
  Dio generalDio(HeaderApiInterceptor apiInterceptor) {
    return Dio()
      ..options.sendTimeout = const Duration(seconds: 10)
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))
      ..interceptors.add(apiInterceptor);
  }

  @lazySingleton
  @Named(ApiConstants.vimeoApiKey)
  Dio vimeoDio() => Dio();

  @lazySingleton
  VinchestaApiClient apiClient(@Named(ApiConstants.baseApiKey) Dio dio) {
    return VinchestaApiClient(dio);
  }
}
