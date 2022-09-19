import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myproject/src/helper/constants/color_extension.dart';

class AppColors {
  const AppColors._();

  /// The main purplish color used for theming the app.
  static Color primaryColor = HexColor.fromHex("#6962E7");

  static Color secondaryColor = HexColor.fromHex("#F1EFF6");

  static Color middleColor = HexColor.fromHex("#A9A6EA");

  static MaterialColor primarySwatch = generateMaterialColor(primaryColor);

  static Color hintTextColor = HexColor.fromHex("#B2B2CE");

  static Color productNameTextColor = HexColor.fromHex("#27214D");

  static Color labelTextColor = HexColor.fromHex("#5A596A");

  static Color textFieldBorderColor = HexColor.fromHex("#C4C4DB");

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
