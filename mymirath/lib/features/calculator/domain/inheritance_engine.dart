import 'calculation_model.dart';

class InheritanceEngine {
  CalculationResult calculate({
    required HeirsInput input,
    required double estate,
  }) {
    final List<HeirShare> result = [];

    double total = 0;

    void add(String label, double share) {
      result.add(HeirShare(label: label, share: share));
      total += share;
    }

    // VERY SIMPLE BASE RULE ENGINE (you can expand later)

    if (input.sons > 0) {
      add("Sons", 0.5);
    }

    if (input.daughters > 0) {
      add("Daughters", 0.25);
    }

    if (input.fatherAlive) {
      add("Father", 0.15);
    }

    if (input.motherAlive) {
      add("Mother", 0.10);
    }

    if (input.wives > 0) {
      add("Wives", 0.125);
    }

    // Residue
    double residue = 1.0 - total;
    if (residue > 0) {
      add("Residue (Asaba)", residue);
    }

    return CalculationResult(shares: result);
  }
}