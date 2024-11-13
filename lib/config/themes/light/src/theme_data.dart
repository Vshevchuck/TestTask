part of '../light_theme.dart';

ThemeData _createTheme() {
  const textTheme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    labelLarge: _labelLarge,
  );

  final themeData = ThemeData(
    textTheme: textTheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    unselectedWidgetColor: AppColors.greyRegular,
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.blueDark),
  );

  return themeData;
}
