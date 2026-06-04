class HeirsInput {
  final int sons;
  final int daughters;
  final bool fatherAlive;
  final bool motherAlive;
  final int wives;

  final int brothers;
  final int sisters;

  final int maternalBrothers;
  final int maternalSisters;

  final int paternalBrothers;
  final int paternalSisters;

  final int fullNephews;
  final int paternalNephews;

  final int fullUncles;
  final int paternalUncles;

  final int fullCousins;
  final int paternalCousins;

  const HeirsInput({
    this.sons = 0,
    this.daughters = 0,
    this.fatherAlive = false,
    this.motherAlive = false,
    this.wives = 0,
    this.brothers = 0,
    this.sisters = 0,
    this.maternalBrothers = 0,
    this.maternalSisters = 0,
    this.paternalBrothers = 0,
    this.paternalSisters = 0,
    this.fullNephews = 0,
    this.paternalNephews = 0,
    this.fullUncles = 0,
    this.paternalUncles = 0,
    this.fullCousins = 0,
    this.paternalCousins = 0,
  });

  HeirsInput copyWith({
    int? sons,
    int? daughters,
    bool? fatherAlive,
    bool? motherAlive,
    int? wives,
    int? brothers,
    int? sisters,
    int? maternalBrothers,
    int? maternalSisters,
    int? paternalBrothers,
    int? paternalSisters,
    int? fullNephews,
    int? paternalNephews,
    int? fullUncles,
    int? paternalUncles,
    int? fullCousins,
    int? paternalCousins,
  }) {
    return HeirsInput(
      sons: sons ?? this.sons,
      daughters: daughters ?? this.daughters,
      fatherAlive: fatherAlive ?? this.fatherAlive,
      motherAlive: motherAlive ?? this.motherAlive,
      wives: wives ?? this.wives,
      brothers: brothers ?? this.brothers,
      sisters: sisters ?? this.sisters,
      maternalBrothers: maternalBrothers ?? this.maternalBrothers,
      maternalSisters: maternalSisters ?? this.maternalSisters,
      paternalBrothers: paternalBrothers ?? this.paternalBrothers,
      paternalSisters: paternalSisters ?? this.paternalSisters,
      fullNephews: fullNephews ?? this.fullNephews,
      paternalNephews: paternalNephews ?? this.paternalNephews,
      fullUncles: fullUncles ?? this.fullUncles,
      paternalUncles: paternalUncles ?? this.paternalUncles,
      fullCousins: fullCousins ?? this.fullCousins,
      paternalCousins: paternalCousins ?? this.paternalCousins,
    );
  }
}

class HeirShare {
  final String label;
  final double share;

  HeirShare({required this.label, required this.share});
}

class CalculationResult {
  final List<HeirShare> shares;

  CalculationResult({required this.shares});
}