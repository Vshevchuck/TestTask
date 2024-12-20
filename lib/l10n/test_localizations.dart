// ignore_for_file: unnecessary_brace_in_string_interps
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'test_localizations_en.dart';
import 'test_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of TestLocalizations
/// returned by `TestLocalizations.of(context)`.
///
/// Applications need to include `TestLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/test_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: TestLocalizations.localizationsDelegates,
///   supportedLocales: TestLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the TestLocalizations.supportedLocales
/// property.
abstract class TestLocalizations {
  TestLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static TestLocalizations of(BuildContext context) {
    return Localizations.of<TestLocalizations>(context, TestLocalizations)!;
  }

  static const LocalizationsDelegate<TestLocalizations> delegate = _TestLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'VinchestaStory'**
  String get appName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Set valid Api base url in order to continue'**
  String get description;

  /// No description provided for @homeScreen.
  ///
  /// In en, this message translates to:
  /// **'Home screen'**
  String get homeScreen;

  /// No description provided for @successCalculations.
  ///
  /// In en, this message translates to:
  /// **'All calculations has finished, you can send yout results to server'**
  String get successCalculations;

  /// No description provided for @sendResultsOnServer.
  ///
  /// In en, this message translates to:
  /// **'Send results on server'**
  String get sendResultsOnServer;

  /// No description provided for @startCountingProcess.
  ///
  /// In en, this message translates to:
  /// **'Start counting process'**
  String get startCountingProcess;

  /// No description provided for @dataSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Data sent successfully'**
  String get dataSentSuccessfully;

  /// No description provided for @previewScreen.
  ///
  /// In en, this message translates to:
  /// **'Preview Screen'**
  String get previewScreen;
}

class _TestLocalizationsDelegate extends LocalizationsDelegate<TestLocalizations> {
  const _TestLocalizationsDelegate();

  @override
  Future<TestLocalizations> load(Locale locale) {
    return SynchronousFuture<TestLocalizations>(lookupTestLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_TestLocalizationsDelegate old) => false;
}

TestLocalizations lookupTestLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TestLocalizationsEn();
    case 'uk': return TestLocalizationsUk();
  }

  throw FlutterError(
    'TestLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
