import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_colors.dart';
import 'core/constants/app_styles.dart';
import 'core/widgets/app_navigation_hub.dart';

import 'features/calculator/presentation/state/calculation_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalculationModel(),
        ),
      ],
      child: const MyMirathApp(),
    ),
  );
}

class MyMirathApp extends StatelessWidget {
  const MyMirathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyMirath',
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
      ),
      home: const AppNavigationHub(),
    );
  }
}