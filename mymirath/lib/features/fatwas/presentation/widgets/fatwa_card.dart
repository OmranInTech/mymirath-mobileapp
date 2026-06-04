import 'package:flutter/material.dart';
import '../../data/fatwa_static_data.dart';

class FatwaCard extends StatelessWidget {
  final FatwaItem item;

  const FatwaCard({super.key, required this.item});

  // Sophisticated, editorial color palette matching your clean background
  Color _getTypeColor(String type) {
    switch (type) {
      case "Quran":
        return const Color(0xFF0F5132); // Deep Sage Green
      case "Hadith":
        return const Color(0xFF0A58CA); // Premium Steel Blue
      case "Warning":
        return const Color(0xFF842029); // Crimson Burgundy
      default:
        return const Color(0xFF41464B); // Slate Charcoal for Rules/Defaults
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeColor = _getTypeColor(item.type);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE2E8F0), // Uniform clean hairline border
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), // Soft modern shadow
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. VISUAL ANCHOR LINE (Left colored accent indicator strip)
              Container(
                width: 5,
                color: typeColor,
              ),

              // 2. CARD CONTENT AREA
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PREMIUM MINI TAG
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: typeColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(6), // Clean geometric tag
                        ),
                        child: Text(
                          item.type.toUpperCase(), // Clean uppercase badge styling
                          style: TextStyle(
                            color: typeColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ACADEMIC TITLE
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A), // Matches your primary dark text
                          letterSpacing: -0.3,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // TEXT TEXTURE & CARRIAGE
                      Text(
                        item.content,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF334155), // High-legibility charcoal slate
                          height: 1.5, // Perfect line height for detailed explanations
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}