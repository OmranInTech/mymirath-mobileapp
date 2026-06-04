# MyMirath Core Mobile Engine

A production-grade, highly optimized cross-platform Flutter application engineered for precise Islamic inheritance distribution calculations under Sharia jurisprudence frameworks. The application decouples mathematical engine execution from presentation layers using a strict **Feature-First Clean Architecture** design paradigm.

## 🛠️ Technical Stack Specifications

*   **Runtime & Cross-Platform Framework:** Flutter SDK `^3.x` / Dart SDK `^3.x`
*   **Operating System Development Environment:** Fedora Linux (Workstation Edition)
*   **Target Compilation Platforms:** Native Android (ARM64 API level 21+) & iOS (LLVM compiled, 13.0+)
*   **Layout Render Architecture:** Declarative Skia / Impeller graphic pipeline engine
*   **State Hydration & Navigation Shell:** Component Lifecycle State Management (`StatefulWidget` / `IndexedStack`)
*   **Design Paradigm Alignment:** 60-30-10 UI Layout Rule utilizing the *Emerald Harbor* color scheme

---

## 📐 Architecture Design Matrix

The codebase drops traditional monolithic web file flows in favor of a **Layered Domain Separation Framework**. This layout prevents data leaks and forces high-velocity rendering updates across execution lifecycles.

[ USER VIEWPORTS ]
    (Dashboard, Calculator, Fatwas, About)
                      │
                      ▼
        [ PRESENTATION LAYER (UI) ]
TextFormFields, Action Toggles, Animation Sheets
                      │
 Passes Inputs Block  │  Emits Hydrated Output State
 (Estate, Heirs List) │  (Primary, Asaba, Radd)
                      ▼
           [ DOMAIN ENGINE LAYER ]
  InheritanceEngine ──► Logic Rule Aggregation


  *   **Presentation Layer:** Contains stateless and stateful widget trees optimized for minimal layout rebuilding. Receptive fields fetch data inputs directly down to logic segments.
*   **Domain/Logic Layer:** Pure Dart algorithmic implementation. Completely independent from the Flutter UI package ecosystem, allowing for 100% predictable unit testing.
*   **Data Layer:** Serves static array payloads (immutable knowledge base entities and cryptographic calculations) out of memory structures.

---

## 🗂️ Production File Directory Topology

```text
lib/
├── main.dart                           # App configuration bootstrap & entry pipeline
├── core/                               # App-wide global immutable shared resources
│   ├── constants/
│   │   ├── app_colors.dart             # UI Palette configuration (60-30-10 Architecture Rule)
│   │   └── app_styles.dart             # Unified typography scale and letter-spacing metrics
│   └── widgets/
│       └── app_navigation_hub.dart     # Multi-viewport persistence manager via IndexedStack
│
└── features/                           # Independent isolated operational business units
    ├── dashboard/                      # Feature 0: App Core Entry Metrics
    │   └── presentation/
    │       ├── screens/
    │       │   └── dashboard_screen.dart
    │       └── widgets/
    │           ├── dashboard_hero.dart # Dynamic linear gradient welcome container
    │           └── dashboard_metrics.dart # Metrics horizontal layout distribution cards
    │
    ├── calculator/                     # Feature 1: The Three-Part Jurisprudence Engine
    │   ├── domain/
    │   │   ├── calculation_model.dart  # Data entity enforcing immutable allocation matrix outputs
    │   │   └── inheritance_engine.dart # Core math algorithm (Ashab al-Furud, Asaba, Radd, Awal)
    │   └── presentation/
    │       ├── screens/
    │       │   └── calculator_screen.dart
    │       └── widgets/
    │           ├── primary_shares_card.dart # UI Viewport Part A: Fixed fractional heirs ledger
    │           ├── asaba_shares_card.dart   # UI Viewport Part B: Residuary calculations grid
    │           └── residue_banner_card.dart # UI Viewport Part C: Automatic Radd/Awal adjustment alerts
    │
    ├── fatwas/                         # Feature 2: Knowledge Base Accords
    │   ├── data/
    │   │   └── fatwa_static_data.dart  # Static repository layer holding immutable QA structural records
    │   └── presentation/
    │       └── screens/
    │           └── fatwas_screen.dart   # Low-overhead expansion tile accordion list interface
    │
    └── about/                          # Feature 3: Registry & Diagnostics View
        └── presentation/
            └── about_screen.dart       # Static metadata, developer credits, and engine compliance notes