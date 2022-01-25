
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/ui/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.lightModeBackgroundColor,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColors.darkModeBackgroundColor,

  );

  static ThemeData light() {
    return lightTheme;
  }

  static ThemeData dark() {
    return darkTheme;
  }
}


extension ThemeExtras on ThemeData {

  Color get textColor => brightness == Brightness.light
          ? AppColors.lightModeTextColor
          : AppColors.darkModeTextColor;

  Color get appBarBackgroundColor => brightness == Brightness.light
      ? AppColors.lightModeAppBarBackgroundColor.withOpacity(0.8)
      : AppColors.darkModeAppBarBackgroundColor.withOpacity(0.8);

  Color get appBarImageColor => brightness == Brightness.light
      ? AppColors.lightModeAppBarImageColor
      : AppColors.darkModeAppBarImageColor;

  Color get containerBackgorunColor => brightness == Brightness.light
      ? AppColors.lightContainerBackgroundColor
      : AppColors.darkContainerBackgroundColor;

  Color get containerElevationColor => brightness == Brightness.light
      ? AppColors.lightContainerElevationColor
      : AppColors.darkContainerElevationColor;

}