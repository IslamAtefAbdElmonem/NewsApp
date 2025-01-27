import 'package:flutter/material.dart';
import 'package:project3/utilties/app_colors.dart';

// theme
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      headlineLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.blackColor),
      labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.greyColor),
      labelLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
    ),
    iconTheme: const IconThemeData(color: AppColors.blackColor),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      headlineLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      bodyMedium: TextStyle(),
      labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.greyColor),
      labelLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
  );
}
