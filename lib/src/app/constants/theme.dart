import 'package:flutter/material.dart';
import 'package:songify/src/app/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorConstants.greenMatte,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
    ),
    dividerColor: Colors.black,
    indicatorColor: ColorConstants.greenMatte,
    shadowColor: Colors.grey.withOpacity(0.12),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(
        color: ColorConstants.greenMatte,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
      titleLarge: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        color: ColorConstants.greenMatte,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorConstants.greenMatte,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primary).copyWith(
      background: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorConstants.greenMatte,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
    ),
    dividerColor: Colors.white,
    indicatorColor: Colors.white,
    shadowColor: Colors.white.withOpacity(0.12),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primary).copyWith(
      background: ColorConstants.lightBlack,
    ),
  );
}
