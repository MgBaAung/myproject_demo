import 'package:flutter/material.dart';

import 'package:myproject/src/helper/constants/app_color.dart';

class AppThemes {
  const AppThemes._();

  static final mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
