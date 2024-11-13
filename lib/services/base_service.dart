import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../api/model/api_error.dart';
import '../../config/di/locator.dart';
import '../../exceptions/api_exception.dart';

import '../config/lost_connection_exeption.dart';
import '../exceptions/application_exception.dart';
import '../exceptions/base_exception.dart';
import '../l10n/test_localizations.dart';

import '../models/lost_connection_type.dart';
import 'preference_service.dart';

abstract class BaseService {
  Logger get logger => locator<Logger>();

  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    final locale = locator<PreferencesService>().getLocale();
    final localizations = lookupTestLocalizations(locale);

    try {
      return await callback();
      // TODO: update
      // ignore: deprecated_member_use
    } on DioError catch (exception) {
      throw await _getProcessedDioError(exception, localizations);
    } on PlatformException {
      rethrow;
    } on SocketException {
      throw LostConnectionException(
        LostConnectionType.noInternetConnection,
      );
    } on ApiException {
      rethrow;
    } on ApplicationException {
      rethrow;
    } catch (exception, stackTrace) {
      logger.e(
        localizations.appName,
        error: exception,
        stackTrace: stackTrace,
      );

      throw const ApplicationException('Error');
    }
  }

  Future<BaseException> _getProcessedDioError(
    // TODO: update
    // ignore: deprecated_member_use
    DioError exception,
    TestLocalizations localizations,
  ) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      return LostConnectionException(
        LostConnectionType.noInternetConnection,
      );
    }

    const unknownApiException = ApiException(
      message: 'Incorrect url',
    );

    try {
      var response = exception.response?.data;

      if (response == null) {
        return unknownApiException;
      }

      if (response is String) {
        response = json.decode(response);
      }

      final apiError = ApiError.fromJson(response);

      if (apiError.status >= 500 && apiError.status < 600) {
        return LostConnectionException(
          LostConnectionType.noServerConnect,
        );
      }

      return ApiException(
        statusCode: apiError.status,
        message: apiError.detail ?? apiError.message,
      );
    } catch (_) {
      return unknownApiException;
    }
  }
}
