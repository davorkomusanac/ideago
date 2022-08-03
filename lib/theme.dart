import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryForegroundColor,
  ),
);
