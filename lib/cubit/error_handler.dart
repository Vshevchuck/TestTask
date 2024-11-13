import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../config/di/locator.dart';
import '../../exceptions/api_exception.dart';

import '../../utils/tagged_logger.dart';
import '../config/lost_connection_exeption.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initialState) : super(initialState);

  void handleError(String errorMessage);

  Logger get logger => locator<Logger>();

  void emitIfNotClosed(TState state) {
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> makeErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } on PlatformException catch (exception, stackTrace) {
      logger.e(
        'PlatformException in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    } on ApiException catch (exception, stackTrace) {
      logger.e(
        'ApiException in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    } on LostConnectionException catch (exception, stackTrace) {
      logger.e(
        'Lost connection error in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    } catch (exception, stackTrace) {
      logger.e(
        'Error in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
      handleError(exception.toString());
    }
  }
}
