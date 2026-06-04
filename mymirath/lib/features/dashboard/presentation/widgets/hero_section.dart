import 'package:flutter/material.dart';
import 'dart:ui';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onScrollToCalculator});

  final VoidCallback onScrollToCalculator;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 480),
      decoration: const BoxDecoration(
        color: Color(0xFF020617), // Pure Dark Obsidian Ink Base
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // DESIGN LAYER 1: Ambient Backdrop Radial Light Core
          Positioned(
            top: -100,
            right: -80,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF10B981).withOpacity(0.18), // Emerald Core Glow
                    const Color(0xFF0EA5E9).withOpacity(0.05), // Sapphire Outer bleeding edge
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // DESIGN LAYER 2: Structural Content Container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // BADGE: Micro-Engineered Shariah Token Pill
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0xFF10B981).withOpacity(0.35),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF10B981).withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFF10B981),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF10B981),
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "SECURE • CRYPTO-MATH VERIFIED",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFF8FAFC),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // BRAND ARCHITECTURE: Asymmetric Title Layout
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Sans', // Adapts cleanly to native system display fonts
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                      height: 1.05,
                    ),
                    children: [
                      TextSpan(
                        text: "My",
                        style: TextStyle(color: Color(0xFFF8FAFC)),
                      ),
                      TextSpan(
                        text: "Mirath",
                        style: TextStyle(
                          color: Color(0xFF10B981), // Pure Emerald Harbor Focus Accent
                          shadows: [
                            Shadow(
                              color: Color(0xFF10B981),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // SUBTITLE DESCRIPTOR HUD
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "ALGORITHMIC ISLAMIC JURISPRUDENCE",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF64748B), // Steel Slate Accent
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // BODY CONSOLE BLOCK
                Text(
                  "Execute structural Shariah asset division calculations instantly. Built with high-precision fractional runtime matrixes to evaluate primary distribution sets, fractional balancing thresholds, and final residuary estate splits automatically.",
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF94A3B8).withOpacity(0.95),
                    height: 1.65,
                    letterSpacing: 0.1,
                  ),
                ),

                const SizedBox(height: 44),

                // CALL TO ACTION PANELS (Modern Premium Split Layout)
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool useVerticalLayout = screenWidth < 360;
                    return useVerticalLayout
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: _buildActions(onScrollToCalculator),
                          )
                        : Row(
                            children: [
                              Expanded(flex: 6, child: _buildActions(onScrollToCalculator)[0]),
                              const SizedBox(width: 14),
                              Expanded(flex: 5, child: _buildActions(onScrollToCalculator)[1]),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActions(VoidCallback onScrollToCalculator) {
    return [
      // Primary High-Impact Core CTA Button
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF10B981).withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: onScrollToCalculator,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF10B981),
            foregroundColor: const Color(0xFF020617),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Initialize Engine",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.terminal_rounded, size: 16),
            ],
          ),
        ),
      ),

      // Secondary Glassmorphic Outlined Metadata Button
      OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFFF8FAFC),
          side: const BorderSide(color: Color(0xFF1E293B), width: 2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          backgroundColor: const Color(0xFF0F172A).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return const Color(0xFF1E293B).withOpacity(0.4);
              }
              return const Color(0xFF0F172A).withOpacity(0.3);
            },
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet_outlined, size: 16, color: Color(0xFF64748B)),
            SizedBox(width: 8),
            Text(
              "System Documentation",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFFE2E8F0),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}