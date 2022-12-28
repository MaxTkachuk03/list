import 'package:flutter/material.dart';
import 'package:list/resources/colors.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData light() {
    return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkButton,
      ),
      scaffoldBackgroundColor: AppColors.light,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightButton,
      ),
      scaffoldBackgroundColor: AppColors.dark,
    );
  }
}
