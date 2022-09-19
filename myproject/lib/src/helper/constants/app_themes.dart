
import 'package:flutter/material.dart';

// Helpers
import 'app_typography.dart';
import 'package:myproject/src/helper/constants/app_color.dart';
/// A utility class that holds themes for the app. It controls
/// how the app looks on different platforms like android, ios etc.
///
/// This class has no constructor and all methods are `static`.
@immutable
class AppThemes {
  const AppThemes._();

  /// The main starting theme for the app.
  ///
  /// Sets the following defaults:
  /// * primaryColor: [AppColors.primaryColor],
  ///
  /// * fontFamily: [AppTypography.primary].fontFamily,
  ///
  /// * textTheme: [AppTypography.primary].textTheme
  ///
  /// * iconTheme: [Colors.white] for default icon
  ///
  /// * textButtonTheme: [TextButtonTheme] without the default padding,
  static final mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: AppTypography.primary.fontFamily,
    textTheme: AppTypography.primary.textTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.lightBackgroundColor,
      titleTextStyle: AppTypography.primary.heading22,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: AppColors.textLightGreyColor),
  );
}
