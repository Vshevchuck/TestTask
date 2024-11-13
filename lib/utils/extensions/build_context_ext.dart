import 'package:flutter/material.dart';

import '../../config/themes/main_theme.dart';
import '../../l10n/test_localizations.dart';

import '../vinchesta_toasts.dart';

extension BuildContextExt on BuildContext {
  TestLocalizations get strings => TestLocalizations.of(this);
  MainThemeData get theme => MainTheme.of(this);
  MainTextThemeData get text => MainTheme.text(this);
  MainColorThemeData get color => MainTheme.color(this);
  MainGradientThemeData get gradient => MainTheme.gradient(this);

  VinchestaToasts get toasts => VinchestaToasts.of(this);

  double get safeBottomPadding => MediaQuery.of(this).padding.bottom;
  double get safeTopPadding => MediaQuery.of(this).padding.top;
  double get viewInsetsBottomPadding => MediaQuery.of(this).viewInsets.bottom;
}
