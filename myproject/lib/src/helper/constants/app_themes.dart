import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myproject/src/helper/constants/app_color.dart';

class AppThemes {
  const AppThemes._();

  static final mainTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.primarySwatch,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
