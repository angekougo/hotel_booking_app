import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/config/constants/app_dimensions.dart';

import '../constants/app_color.dart';

class AppTheme {
  // Light theme
  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        // Body text (paragraphs)
        bodyLarge: const TextStyle(
            fontSize: AppDimensions.fontBodyLarge,
            fontWeight: FontWeight.normal,
            color: AppColors.lightText),
        bodyMedium: const TextStyle(
            fontSize: AppDimensions.fontBodyMedium,
            fontWeight: FontWeight.normal,
            color: AppColors.lightText), // default size app

        // short text (captions, badges)
        bodySmall: const TextStyle(
            fontSize: AppDimensions.fontBodySmall, color: Colors.grey),
      ), // Inter par défaut
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.lightTextSecondary,
        surface: AppColors.scaffoldBackgroundColor,
        onSurface: AppColors.lightText,
        
      ),
      scaffoldBackgroundColor:  AppColors.scaffoldBackgroundColor,
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        // Body text (paragraphs)
        bodyLarge: const TextStyle(
            fontSize: AppDimensions.fontBodyLarge,
            fontWeight: FontWeight.normal,
            color: AppColors.darkText),
        bodyMedium: const TextStyle(
            fontSize: AppDimensions.fontBodyMedium,
            fontWeight: FontWeight.normal,
            color: AppColors.darkText), // default size app

        // short text (captions, badges)
        bodySmall: const TextStyle(
            fontSize: AppDimensions.fontBodySmall, color: Colors.grey),
      ), // Inter par défaut
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.darkTextSecondary,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
      ),
      scaffoldBackgroundColor: AppColors.darkSurface,
    );
  }
}
