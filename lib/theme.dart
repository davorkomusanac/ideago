import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryForegroundColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primaryForegroundColor,
    selectionHandleColor: AppColors.primaryForegroundColor,
    selectionColor: AppColors.primaryForegroundColor,
  ),
  dialogBackgroundColor: AppColors.primaryBackgroundColor,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryForegroundColor,
    onPrimary: AppColors.white,
  ),
);
