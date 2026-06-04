import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'core/constants/app_styles.dart';
import 'core/widgets/app_navigation_hub.dart';

void main() {
  runApp(const MyMirathApp());
}

class MyMirathApp extends StatelessWidget {
  const MyMirathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'MyMirath',

      // =========================
      // THEME SYSTEM
      // =========================
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          background: AppColors.background,
          surface: AppColors.surface,
        ),

        scaffoldBackgroundColor: AppColors.background,

        textTheme: AppStyles.textTheme,

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),

      // =========================
      // ROOT NAVIGATION
      // =========================
      home: const AppNavigationHub(),
    );
  }
}