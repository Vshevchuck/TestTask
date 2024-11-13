part of '../light_theme.dart';

class _LightGradientTheme implements MainGradientThemeData {
  const _LightGradientTheme();

  @override
  LinearGradient get primaryGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0, 0.7],
        colors: [
          AppColors.blueBlack,
          AppColors.blueExtraDark,
        ],
      );

  @override
  Gradient get secondGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.9],
        colors: [
          AppColors.purpleLight,
          AppColors.purple,
        ],
      );
}
