import 'package:flutter/material.dart';

abstract class ColorConstants {
  static const int primaryColorCode = 0xFF306060;
  static const int primaryAccentColorCode = 0xFF40FFFF;
  static const greenMatte = Color(primaryColorCode);
  static const baseColor = Color(0xFFF6F6F6);
  static const lightBlack = Color(0xFF212121);
}

const MaterialColor primary =
    MaterialColor(ColorConstants.primaryColorCode, <int, Color>{
  50: Color(0xFFE6ECEC),
  100: Color(0xFFC1CFCF),
  200: Color(0xFF98B0B0),
  300: Color(0xFF6E9090),
  400: Color(0xFF4F7878),
  500: ColorConstants.greenMatte,
  600: Color(0xFF2B5858),
  700: Color(0xFF244E4E),
  800: Color(0xFF1E4444),
  900: Color(0xFF133333),
});

const MaterialColor primaryAccent =
    MaterialColor(ColorConstants.primaryAccentColorCode, <int, Color>{
  100: Color(0xFF73FFFF),
  200: Color(ColorConstants.primaryAccentColorCode),
  400: Color(0xFF0DFFFF),
  700: Color(0xFF00F2F2),
});
