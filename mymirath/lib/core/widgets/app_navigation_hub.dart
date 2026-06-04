import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/screens/home_screen.dart';
import '../../features/calculator/presentation/screens/calculator_screen.dart';
import '../../features/fatwas/presentation/screens/fatwas_screen.dart';
import '../../features/about/presentation/screens/about_screen.dart';

class AppNavigationHub extends StatefulWidget {
  const AppNavigationHub({super.key});

  @override
  State<AppNavigationHub> createState() => _AppNavigationHubState();
}

class _AppNavigationHubState extends State<AppNavigationHub> {
  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    CalculatorScreen(),
    FatwasScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calc",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Fatwas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
        ],
      ),
    );
  }
}