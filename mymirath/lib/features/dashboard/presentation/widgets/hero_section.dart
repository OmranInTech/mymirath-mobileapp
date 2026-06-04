import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onScrollToCalculator});

  final VoidCallback onScrollToCalculator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F172A), // deep dark navy
            Color(0xFF111827), // slightly lighter dark
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MyMirath",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Islamic Inheritance Calculator",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Calculate Shariah-compliant inheritance shares with accuracy for children, spouses, parents, and siblings.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              ElevatedButton(
                onPressed: onScrollToCalculator,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                ),
                child: const Text("Start Calculation"),
              ),

              const SizedBox(width: 12),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white54),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                ),
                child: const Text("Learn More"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}