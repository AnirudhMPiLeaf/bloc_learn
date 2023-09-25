import 'package:bloc_learn/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: AppColors.baseColorLight,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: AppColors.baseColorDark,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
