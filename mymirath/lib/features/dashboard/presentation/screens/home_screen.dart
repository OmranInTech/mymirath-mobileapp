import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Keeping your exact clean canvas color
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= HERO SECTION =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F172A), // Your exact original deep blue-gray
                    Color(0xFF111827),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "MyMirath",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Islamic Inheritance Calculator",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Accurate Sharia-compliant inheritance distribution for family members with modern simplicity.",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= STATS HUD (FLUID ROW) =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(child: _StatCard(title: "Accuracy", value: "100%")),
                  SizedBox(width: 12),
                  Expanded(child: _StatCard(title: "Cases", value: "10K+")),
                  SizedBox(width: 12),
                  Expanded(child: _StatCard(title: "Users", value: "5K+")),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ================= FEATURES HEADER =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Features",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ================= FEATURES CARD LIST =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _FeatureCard(
                    title: "Shariah Calculation Engine",
                    desc: "Accurate distribution based on Islamic inheritance laws.",
                    icon: Icons.calculate_outlined,
                  ),
                  SizedBox(height: 12),
                  _FeatureCard(
                    title: "Family Share Breakdown",
                    desc: "Clearly see who gets what in each scenario.",
                    icon: Icons.family_restroom_outlined,
                  ),
                  SizedBox(height: 12),
                  _FeatureCard(
                    title: "Verified Fatwas",
                    desc: "Islamic scholarly references for transparency.",
                    icon: Icons.menu_book_outlined,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ================= ORIGINAL LIGHT METRICS CARD (REFACTORED FIT) =================
class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white, // Keeping your clean white surfaces
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0), // Ultra-clean subtle modern border
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // Softened modern shadow
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12, 
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= ORIGINAL FEATURE CARD (GEOMETRIC CLEAN ALIGNMENT) =================
class _FeatureCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;

  const _FeatureCard({
    required this.title,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Keeping your clean white surfaces
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // Softened modern shadow
            blurRadius: 14,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Cleaner look for multiline descriptions
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9), // Subtle light background for the icon
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 24, color: const Color(0xFF0F172A)), // Your exact black/dark gray icon color
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}