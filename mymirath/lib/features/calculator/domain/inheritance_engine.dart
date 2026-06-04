class InheritanceResult {
  final Map<String, double> shares;
  final double baytulmal;

  InheritanceResult({
    required this.shares,
    required this.baytulmal,
  });
}

class InheritanceEngine {
  static InheritanceResult calculateShares({
    int wives = 0,
    bool husbandAlive = false,
    int sons = 0,
    int daughters = 0,
    bool motherAlive = false,
    bool fatherAlive = false,
    int brothers = 0,
    int sisters = 0,
    int grandsons = 0,
    int granddaughters = 0,
    bool grandfatherAlive = false,
    bool maternalGrandmotherAlive = false,
    bool paternalGrandmotherAlive = false,
    int maternalBrothers = 0,
    int maternalSisters = 0,
    int paternalBrothers = 0,
    int paternalSisters = 0,
    int fullNephews = 0,
    int paternalNephews = 0,
    int fullUncles = 0,
    int paternalUncles = 0,
    int fullCousins = 0,
    int paternalCousins = 0,
    String madhhab = 'hanafi',
  }) {
    final shares = <String, double>{};

    void set(String k, double v) => shares[k] = v;

    set('husband', 0);
    set('wives', 0);
    set('mother', 0);
    set('father', 0);
    set('sons', 0);
    set('daughters', 0);

    double residue = 1.0;

    // Husband / Wife
    if (husbandAlive) {
      set('husband', (sons + daughters > 0) ? 0.25 : 0.5);
      residue -= shares['husband']!;
    } else if (wives > 0) {
      set('wives', (sons + daughters > 0) ? 0.125 : 0.25);
      residue -= shares['wives']!;
    }

    // Mother
    if (motherAlive) {
      set('mother', (sons + daughters > 0 || brothers + sisters >= 2) ? 1 / 6 : 1 / 3);
      residue -= shares['mother']!;
    }

    // Father
    if (fatherAlive) {
      set('father', sons > 0 || daughters > 0 ? 1 / 6 : 1 / 3);
      residue -= shares['father']!;
    }

    // Children (residue)
    if (sons + daughters > 0 && residue > 0) {
      int units = sons * 2 + daughters;
      double unit = residue / units;

      set('sons', unit * 2 * sons);
      set('daughters', unit * daughters);

      residue = 0;
    }

    return InheritanceResult(
      shares: shares,
      baytulmal: residue < 0 ? 0 : residue,
    );
  }
}