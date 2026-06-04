import 'package:flutter/material.dart';
import '../../data/fatwa_static_data.dart';
import '../widgets/fatwa_card.dart';

class FatwasScreen extends StatelessWidget {
  const FatwasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "Islamic Inheritance Guidance",
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF0F172A),
        ),
      ),
      // NotificationListener catches and completely stops the overscroll stretch margin gaps
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator(); // This prevents the list from stretching or pulling away
          return true;
        },
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: fatwas.length + 1,
          physics: const ClampingScrollPhysics(), // Uses tight clamping physics instead of bouncing
          itemBuilder: (context, index) {
            // INDEX 0: PREMIUM EDUCATIONAL HEADER BANNER
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2, right: 12),
                      child: Icon(
                        Icons.info_outline_rounded,
                        size: 20,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Islamic Inheritance (Faraid) is a divinely prescribed system based directly on text mandates from the Quran and Sunnah. This repository provides foundational guidance, legal references, and educational notes.",
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFF334155),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            // INDEX 1 TO N: RENDER MODERNISED LIST ENTRIES
            final currentFatwaItem = fatwas[index - 1];
            return FatwaCard(item: currentFatwaItem);
          },
        ),
      ),
    );
  }
}