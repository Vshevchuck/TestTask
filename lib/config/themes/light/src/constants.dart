part of '../light_theme.dart';

const _textButtonLetterSpacing = 0.01;

const _displayLarge = _TextStyle(48, FontWeight.w800, AppColors.black);
const _displayMedium = _TextStyle(
  42,
  FontWeight.w700,
  AppColors.black,
  height: 1,
);
const _displaySmall = _TextStyle(30, FontWeight.w500, AppColors.black);
const _headlineMedium = _TextStyle(22, FontWeight.w500, AppColors.black);
const _headlineSmall = _TextStyle(20, FontWeight.w500, AppColors.black);
const _titleLarge = _TextStyle(16, FontWeight.w400, AppColors.black);
const _titleMedium = _TextStyle(18, FontWeight.w400, AppColors.blueDark);
const _titleSmall = _TextStyle(14, FontWeight.w400, AppColors.blueDark);
const _bodyLarge = _TextStyle(14, FontWeight.w400, AppColors.black);
const _bodyMedium = _TextStyle(16, FontWeight.w400, AppColors.blueDark);

const _labelLarge = _TextStyle(
  20,
  FontWeight.w600,
  AppColors.white,
  letterSpacing: _textButtonLetterSpacing,
);

class _TextStyle extends TextStyle {
  const _TextStyle(
    double size,
    FontWeight weight,
    Color color, {
    super.letterSpacing,
    super.height,
  }) : super(
          fontSize: size,
          fontWeight: weight,
          color: color,
          fontFamily: WybFontFamily.sFProRounded,
        );
}

abstract class AppColors {
  static const res1Background = Color(0xFFE2DFCE);
  static const res2TileBackground = Color(0xFFD5D2C1);
  static const res3AppBar = Color(0xFFE38936);
  static const res3Line = Color(0xFF634C22);
  static const res4Border = Color(0xFFB7B4A3);

  ///
  /// Red
  ///

  static const redDark = Color(0xFF8B0000);
  static const redRegular = Color(0xFFD66359);
  static const purple = Color(0xFF968bc0);
  static const purpleLight = Color.fromARGB(255, 130, 55, 141);

  ///
  /// Blue
  ///
  static const blueBlack = Color.fromARGB(255, 86, 85, 110);
  static const blueDark = Color(0xFF2f2e40);
  static const blueLight = Color.fromARGB(255, 72, 71, 94);
  static const blueExtraDark = Color.fromARGB(255, 32, 31, 44);
  static const blueRegular = Colors.blue;
  static const blueTurquoiseDark = Color(0xFF3A8F8A);
  static const blueTurquoise = Color.fromARGB(255, 185, 220, 248);
  static const blueAccent = Color(0xFF4ba49e);
  static const blueAccent3 = Color.fromARGB(255, 18, 102, 96);
  static const blueAccent4 = Color.fromARGB(255, 96, 75, 164);
  static const blueAccent5 = Color(0xFF4ba49e);

  ///
  /// Greyscale
  ///

  static const black = Colors.black;
  static const greyDark = Color(0xFFA8A6A6);
  static const grey = Color.fromARGB(255, 205, 202, 202);
  static const greyRegular = Color(0xFFc3c3c3);
  static const white = Colors.white;

  ///
  /// Yellow
  ///
  static const yellow = Color.fromARGB(255, 165, 116, 1);
  static const yellowLight = Color.fromARGB(255, 224, 207, 22);
}
