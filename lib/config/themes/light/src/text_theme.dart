part of '../light_theme.dart';

class _LightTextThemeData implements MainTextThemeData {
  const _LightTextThemeData();
  @override
  TextStyle get floatingLabelTextStyle => const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get floatingInactiveLabelText => const TextStyle(
        color: AppColors.greyRegular,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get primaryFieldText => const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get vinchestaTextField => const TextStyle(
        color: AppColors.white,
      );

  @override
  TextStyle get labelUnselected => const TextStyle(
        color: AppColors.greyRegular,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get mainPageTileLabel => TextStyle(
        color: AppColors.grey,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 11.sp,
      );

  @override
  TextStyle get appBarTitle => TextStyle(
        color: AppColors.white,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      );

  @override
  TextStyle get vinchestaTextButton => TextStyle(
        color: AppColors.white,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      );
}
