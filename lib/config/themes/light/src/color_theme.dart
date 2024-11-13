part of '../light_theme.dart';

class _LightColorThemeData implements MainColorThemeData {
  const _LightColorThemeData();

  @override
  Color get textFieldFillColor => AppColors.blueDark;

  @override
  Color get textFieldDisabledBorder => AppColors.greyRegular;

  @override
  Color get textFieldEnabledBorder => AppColors.blueDark;

  @override
  Color get textFieldFocusedBorder => AppColors.purple;

  @override
  Color get textFieldErrorBorder => AppColors.redRegular;

  @override
  Color get textFieldFocusedErrorBorder => AppColors.redRegular;

  @override
  Color get textNoBorderFieldDisabledBorder => AppColors.white;

  @override
  Color get textNoBorderFieldEnabledBorder => AppColors.white;

  @override
  Color get textNoBorderFieldFocusedBorder => AppColors.purple;

  @override
  Color get textNoBorderFieldErrorBorder => AppColors.redRegular;

  @override
  Color get textNoBorderFieldFocusedErrorBorder => AppColors.redRegular;

  @override
  Color get appBarBackground => AppColors.blueLight;

  @override
  Color get appBarDivider => AppColors.black;

  @override
  Color get appBarShadow => AppColors.greyDark;

  @override
  Color get errorColor => AppColors.redDark;

  @override
  Color get blueRegular => AppColors.blueRegular;

  @override
  Color get button => AppColors.blueTurquoise;

  @override
  Color get disable => AppColors.grey;

  @override
  Color get disableBorder => AppColors.greyDark;
}
