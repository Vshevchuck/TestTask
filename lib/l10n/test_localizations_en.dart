// ignore_for_file: unnecessary_brace_in_string_interps

import 'test_localizations.dart';

/// The translations for English (`en`).
class TestLocalizationsEn extends TestLocalizations {
  TestLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'VinchestaStory';

  @override
  String get description => 'Set valid Api base url in order to continue';

  @override
  String get homeScreen => 'Home screen';

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
