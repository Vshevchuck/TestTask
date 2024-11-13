// ignore_for_file: unnecessary_brace_in_string_interps

import 'test_localizations.dart';

/// The translations for Ukrainian (`uk`).
class TestLocalizationsUk extends TestLocalizations {
  TestLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'TestTask';

  @override
  String get description => 'Set valid Api base url in order to continue';

  @override
  String get homeScreen => 'Домашня сторінка';

  @override
  String get successCalculations => 'All calculations has finished, you can send yout results to server';

  @override
  String get sendResultsOnServer => 'Send results on server';

  @override
  String get startCountingProcess => 'Start counting process';

  @override
  String get dataSentSuccessfully => 'Data sent successfully';

  @override
  String get previewScreen => 'Preview Screen';
}
