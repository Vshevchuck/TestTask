import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/utils/extensions/build_context_ext.dart';

import '../views/toast_view.dart';

class VinchestaToasts {
  final BuildContext context;
  late final FToast _toasts;

  VinchestaToasts.of(this.context) {
    _toasts = FToast();
    _toasts.init(context);
  }

  void showSuccess({
    required String message,
  }) {
    _toasts.showToast(
      gravity: ToastGravity.BOTTOM,
      child: ToastView(
        message: message,
        backgroundColor: context.color.appBarDivider,
        titleCentered: true,
      ),
    );
  }

  void showError({
    required String message,
  }) {
    _toasts.showToast(
      gravity: ToastGravity.BOTTOM,
      child: ToastView(
        message: message,
        backgroundColor: context.color.errorColor,
        titleCentered: true,
      ),
    );
  }
}
