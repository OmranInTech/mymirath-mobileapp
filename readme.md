# 🧭 MyMirath Core Mobile Engine

A production-grade Flutter application engineered for **Islamic inheritance (Faraid) calculations** using a deterministic rule-based domain engine.

---

## ⚙️ Installation Guide

### 1. Prerequisites
Install Flutter SDK:
https://flutter.dev/docs/get-started/install

Check installation:
```bash
flutter doctor
```

### 2. Clone Project
```bash
git clone <your-repo-url>
cd mymirath
```

### 3. Get Dependencies
```bash
flutter pub get
```

### 4. Run Application
```bash
flutter run
```

---

## 🧠 Tech Stack

- Flutter 3.x
- Dart 3.x
- Provider State Management
- Clean Architecture (Feature-first)
- Android / iOS support

---

## 🏗️ Architecture

Presentation Layer → Domain Engine → State Layer

- UI: Flutter Widgets
- Domain: InheritanceEngine (Pure Dart)
- State: ChangeNotifier (Provider)

---

## 📁 Project Structure

lib/
│
├── core/                               # Application shell and global state
│   ├── constants/
│   │   ├── app_colors.dart             # Your color design system (60-30-10)
│   │   └── app_styles.dart             # Typography rules
│   └── widgets/
│       └── app_navigation_hub.dart     # The bottom navigation container bar
│
├── features/                           # Independent core modules
│   │
│   ├── dashboard/                      # Feature 1: Dashboard Info Hub
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── dashboard_screen.dart
│   │       └── widgets/
│   │           ├── dashboard_hero.dart
│   │           └── dashboard_metrics.dart
│   │
│   ├── calculator/                     # Feature 2: The 3-Part Sharia Engine
│   │   ├── domain/
│   │   │   ├── calculation_model.dart  # Data blueprint for inputs/outputs
│   │   │   └── inheritance_engine.dart # Core math rules for Primary, Asaba, & Radd
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── calculator_screen.dart
│   │       └── widgets/
│   │           ├── primary_shares_card.dart  # Part A display
│   │           ├── asaba_shares_card.dart    # Part B display
│   │           └── residue_banner_card.dart  # Part C display
│   │
│   ├── fatwas/                         # Feature 3: Scriptural Context
│   │   ├── data/
│   │   │   └── fatwa_static_data.dart  # Local verified QA array store
│   │   └── presentation/
│   │       └── screens/
│   │           └── fatwas_screen.dart   # Drop-down accordion view
│   │
│   └── about/                          # Feature 4: Platform Metadata
│       └── presentation/
│           └── about_screen.dart       # Static details & credits view
│
└── main.dart                           # Root application initialization

---

## 🧮 Core Engine

- Fixed Shares (Faraid)
- Residual Shares (Asaba)
- Baytulmal handling
- Real-time recalculation

---

## 🚀 Run Commands Summary

flutter pub get
flutter run
flutter clean

---

## 📜 License

Educational / Research Use Only