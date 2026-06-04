import 'package:flutter/material.dart';
import 'package:mymirath/core/constants/app_colors.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("About MyMirath"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =========================
            // HERO CARD
            // =========================
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary.withOpacity(0.08),
                border: Border.all(color: primary.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "MyMirath",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "An Islamic Inheritance Calculator built to simplify Faraid (Islamic inheritance law) using structured, accurate, and educational computation.",
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // WHAT WE SERVE
            // =========================
            const Text(
              "What We Serve",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            _infoCard(
              title: "Islamic Inheritance Calculation",
              desc:
                  "Automated Faraid computation based on classical Islamic rules including Primary Heirs, Asaba, and Dhawu al-Arham.",
            ),

            _infoCard(
              title: "Educational Fatwas",
              desc:
                  "Guided explanations from Quranic verses and authentic Hadiths to help users understand inheritance rules.",
            ),

            _infoCard(
              title: "User-Friendly Experience",
              desc:
                  "A modern interface designed for clarity, accessibility, and ease of use for all users.",
            ),

            const SizedBox(height: 20),

            // =========================
            // DEVELOPER SECTION
            // =========================
            const Text(
              "Developer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Omran Ahmadzai",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Flutter Developer & Creator of MyMirath",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "I built this platform to simplify Islamic inheritance calculations and make Faraid accessible, accurate, and easy to understand for everyone.",
                    style: TextStyle(height: 1.4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // PURPOSE SECTION
            // =========================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "⚠️ Disclaimer:\nThis application is for educational purposes only. "
                "Complex inheritance cases should always be verified with a qualified Islamic scholar.",
                style: TextStyle(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required String desc}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: const TextStyle(height: 1.4),
          ),
        ],
      ),
    );
  }
}