import 'package:flutter/material.dart';
import '../../data/fatwa_static_data.dart';
import '../widgets/fatwa_card.dart';

class FatwasScreen extends StatelessWidget {
  const FatwasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Islamic Inheritance Guidance"),
        centerTitle: true,
      ),

      body: Container(
        color: const Color(0xFFF7F7F7),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // HEADER BOX
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Islamic Inheritance (Faraid) is a divinely prescribed system based on the Quran and Sunnah. "
                "This section provides guidance, references, and educational notes.",
                style: TextStyle(height: 1.4),
              ),
            ),

            const SizedBox(height: 16),

            // FATWA LIST
            ...fatwas.map((e) => FatwaCard(item: e)),
          ],
        ),
      ),
    );
  }
}