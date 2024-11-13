import 'dart:io';
import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

@injectable
@preResolve
class PreferencesService {
  static const _preferencesBox = '_preferencesBox';

  static const _localeKey = '_localeKey';

  final Box<dynamic> _box;

  PreferencesService._(this._box);

  @factoryMethod
  static Future<PreferencesService> getInstance() async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return PreferencesService._(box);
  }

  /// Localization

  String getDefaultLanguageCode() {
    return 'en';
  }

  Locale getLocale() {
    final languageCode = _box.get(_localeKey) ?? getDefaultLanguageCode();
    return Locale(languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    await _box.put(_localeKey, locale.languageCode);
  }
}
