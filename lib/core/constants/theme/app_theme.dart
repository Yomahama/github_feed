import 'package:flutter/material.dart';
import 'package:github_feed/core/constants/theme/app_colors.dart';

abstract class AppTheme {
  ThemeData get data;
}

class AppThemeDefault extends AppTheme {
  @override
  ThemeData get data => ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        dividerTheme: const DividerThemeData(color: AppColors.grey200, space: 1),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 17),
          headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          labelSmall: TextStyle(color: Colors.grey),
        ),
        useMaterial3: true,
      );
}
