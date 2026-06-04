import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_colors.dart';
import 'core/constants/app_styles.dart';
import 'core/widgets/app_navigation_hub.dart';

import 'package:mymirath/features/calculator/domain/calculation_model.dart';

void main() {
  runApp(const MyMirathApp());
}

class MyMirathApp extends StatelessWidget {
  const MyMirathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalculationModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyMirath',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.accent,
            surface: AppColors.surface,
          ),
          scaffoldBackgroundColor: AppColors.background,
          textTheme: AppStyles.textTheme,
        ),
        home: const AppNavigationHub(),
      ),
    );
  }
}