import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../services/preference_service.dart';
import '../api_constants.dart';
import '../vinchesta_api_client.dart';

@injectable
class HeaderApiInterceptor implements Interceptor {
  final PreferencesService _preferencesService;

  HeaderApiInterceptor(
    this._preferencesService,
  );

  @override
  // ignore: deprecated_member_use
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldLogOut(err.response?.statusCode)) {
      // _logoutService.logout();
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.contentType == Headers.multipartFormDataContentType) {
      options.sendTimeout = const Duration(minutes: 10);
      options.receiveTimeout = const Duration(minutes: 10);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  bool _shouldLogOut(int? statusCode) {
    if (statusCode == null) return false;

    const logOutStatuses = [401];

    return logOutStatuses.contains(statusCode);
  }
}
