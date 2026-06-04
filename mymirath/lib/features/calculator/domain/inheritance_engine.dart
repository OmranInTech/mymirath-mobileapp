class InheritanceResult {
  final Map<String, double> shares;
  final double baytulmal;

  InheritanceResult({required this.shares, required this.baytulmal});
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
    final Map<String, double> shares = {
      'wives': 0.0,
      'husband': 0.0,
      'sons': 0.0,
      'daughters': 0.0,
      'mother': 0.0,
      'father': 0.0,
      'brothers': 0.0,
      'sisters': 0.0,
      'grandsons': 0.0,
      'granddaughters': 0.0,
      'grandfather': 0.0,
      'maternalGrandmother': 0.0,
      'paternalGrandmother': 0.0,
      'maternalBrothers': 0.0,
      'maternalSisters': 0.0,
      'paternalBrothers': 0.0,
      'paternalSisters': 0.0,
      'fullNephews': 0.0,
      'paternalNephews': 0.0,
      'fullUncles': 0.0,
      'paternalUncles': 0.0,
      'fullCousins': 0.0,
      'paternalCousins': 0.0,
    };

    final bool hasChildren = (sons + daughters) > 0;
    final bool hasSons = sons > 0;
    final bool hasDaughters = daughters > 0;
    final bool hasGrandchildren = (grandsons + granddaughters) > 0;

    if (husbandAlive) {
      shares['husband'] = (hasChildren || hasGrandchildren || grandsons > 0) ? 1 / 4 : 1 / 2;
    } else if (wives > 0) {
      final bool hasChildOrGrandchild = hasChildren || hasGrandchildren || grandsons > 0 || granddaughters > 0;
      final bool nobodyElse = !hasChildOrGrandchild && !fatherAlive && !motherAlive && brothers == 0 && sisters == 0;
      final bool hasSonsSon = grandsons > 0;

      double totalWifeShare = 0.0;
      if (nobodyElse) {
        totalWifeShare = 1 / 4;
      } else if (hasChildOrGrandchild || hasSonsSon) {
        totalWifeShare = 1 / 8;
      } else {
        totalWifeShare = 1 / 4;
      }

      if (wives == 1) {
        shares['wives'] = totalWifeShare;
      } else if (wives == 2) {
        if (hasChildOrGrandchild || hasSonsSon) {
          shares['wives'] = 2 * (1 / 16);
        } else {
          shares['wives'] = 2 * (1 / 8);
        }
      } else if (wives == 3) {
        double share1, share2, share3, sumShares, factor;
        if (hasChildOrGrandchild || hasSonsSon) {
          share1 = 1 / 12;
          share2 = 1 / 24;
          share3 = 1 / 24;
          sumShares = share1 + share2 + share3;
          factor = (1 / 8) / sumShares;
          shares['wives'] = factor * sumShares;
        } else {
          share1 = 1 / 6;
          share2 = 1 / 12;
          share3 = 1 / 12;
          sumShares = share1 + share2 + share3;
          factor = (1 / 4) / sumShares;
          shares['wives'] = factor * sumShares;
        }
      } else {
        shares['wives'] = totalWifeShare;
      }
    }

    if (motherAlive) {
      if (hasChildren || (brothers + sisters) >= 2) {
        shares['mother'] = 1 / 6;
      } else {
        shares['mother'] = 1 / 3;
      }
    }

    if (fatherAlive) {
      if (hasChildren) {
        shares['father'] = 1 / 6;
      } else {
        shares['father'] = 1 / 3;
      }
      shares['brothers'] = 0.0;
      shares['sisters'] = 0.0;
      shares['paternalBrothers'] = 0.0;
      shares['paternalSisters'] = 0.0;
    }

    if (daughters > 0 && sons == 0) {
      if (daughters == 1) {
        if (brothers == 0 && fatherAlive == false && sons == 0) {
          shares['daughters'] = 1.0;
        } else {
          shares['daughters'] = 1 / 2;
        }
      } else {
        shares['daughters'] = 2 / 3;
      }
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['paternalBrothers'] = 0.0;
      shares['paternalSisters'] = 0.0;
    }

    if (sons == 0 && daughters == 0) {
      if (granddaughters == 1 && grandsons == 0) {
        shares['granddaughters'] = 1 / 2;
      } else if (granddaughters > 1 && grandsons == 0) {
        shares['granddaughters'] = 2 / 3;
      }
    }

    if (sons == 0 && daughters == 0 && (grandsons > 0 || granddaughters > 0)) {
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullNephews'] = 0.0;
      shares['paternalNephews'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
      shares['grandfather'] = 0.0;
      shares['brothers'] = 0.0;
      shares['sisters'] = 0.0;
      shares['paternalBrothers'] = 0.0;
      shares['paternalSisters'] = 0.0;
    }

    if (sons > 0) {
      shares['grandsons'] = 0.0;
      shares['granddaughters'] = 0.0;
    } else if (grandsons > 0) {
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullNephews'] = 0.0;
      shares['paternalNephews'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
      shares['grandfather'] = 0.0;
    }

    double fixedTotal = 0.0;
    shares.forEach((key, value) => fixedTotal += value);

    if (fixedTotal > 1.0) {
      shares.forEach((key, value) {
        shares[key] = value / fixedTotal;
      });
      fixedTotal = 1.0;
    }

    double residue = 1.0 - fixedTotal;

    if (hasSons) {
      int units = (sons * 2) + daughters;
      double unitShare = residue / units;
      shares['sons'] = (shares['sons'] ?? 0.0) + (2 * unitShare * sons);
      shares['daughters'] = (shares['daughters'] ?? 0.0) + (unitShare * daughters);
      residue = 0.0;
      shares['grandfather'] = 0.0;
      shares['maternalGrandmother'] = 0.0;
      shares['paternalGrandmother'] = 0.0;
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullNephews'] = 0.0;
      shares['paternalNephews'] = 0.0;
    } else if (!hasSons && (grandsons > 0 || granddaughters > 0)) {
      int units = (grandsons * 2) + granddaughters;
      double unitShare = residue / units;
      shares['grandsons'] = (shares['grandsons'] ?? 0.0) + (2 * unitShare * grandsons);
      shares['granddaughters'] = (shares['granddaughters'] ?? 0.0) + (unitShare * granddaughters);
      residue = 0.0;
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullNephews'] = 0.0;
      shares['paternalNephews'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
      shares['grandfather'] = 0.0;
    }

    if (fatherAlive && residue > 0) {
      if (!hasChildren || (!hasSons && hasDaughters)) {
        shares['father'] = (shares['father'] ?? 0.0) + residue;
        residue = 0.0;
      }
    }

    if (!fatherAlive && sons == 0 && grandsons == 0 && (brothers + sisters > 0) && residue > 0) {
      int units = (brothers * 2) + sisters;
      double unitShare = residue / units;
      shares['brothers'] = (shares['brothers'] ?? 0.0) + (2 * unitShare * brothers);
      shares['sisters'] = (shares['sisters'] ?? 0.0) + (unitShare * sisters);
      residue = 0.0;
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullNephews'] = 0.0;
      shares['paternalNephews'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
    }

    double maternalSiblingsShare = 0.0;
    final bool hasMaternalSiblings = (maternalBrothers + maternalSisters) > 0;
    if (hasMaternalSiblings &&
        !motherAlive &&
        !fatherAlive &&
        sons == 0 &&
        daughters == 0 &&
        grandsons == 0 &&
        granddaughters == 0) {
      int totalMaternalSiblings = maternalBrothers + maternalSisters;
      maternalSiblingsShare = 1 / 6;

      shares['maternalBrothers'] = (maternalBrothers / totalMaternalSiblings) * maternalSiblingsShare;
      shares['maternalSisters'] = (maternalSisters / totalMaternalSiblings) * maternalSiblingsShare;

      residue -= maternalSiblingsShare;
      if (residue < 0) residue = 0.0;
    } else {
      shares['maternalBrothers'] = 0.0;
      shares['maternalSisters'] = 0.0;
    }

    if (sons > 0 || grandsons > 0 || fatherAlive || grandfatherAlive || brothers > 0 || paternalBrothers > 0) {
      shares['fullNephews'] = 0.0;
    }
    if (sons > 0 || grandsons > 0 || fatherAlive || grandfatherAlive || brothers > 0 || fullNephews > 0 || paternalBrothers > 0) {
      shares['paternalNephews'] = 0.0;
    }

    if (fullNephews > 0 && sons == 0 && grandsons == 0 && !fatherAlive && !grandfatherAlive && brothers == 0 && paternalBrothers == 0 && residue > 0) {
      shares['fullNephews'] = residue;
      residue = 0.0;
      shares['paternalNephews'] = 0.0;
    } else {
      shares['fullNephews'] = 0.0;
    }

    if (paternalNephews > 0 && sons == 0 && grandsons == 0 && !fatherAlive && !grandfatherAlive && brothers == 0 && fullNephews == 0 && paternalBrothers == 0 && residue > 0) {
      shares['paternalNephews'] = residue;
      residue = 0.0;
    } else {
      shares['paternalNephews'] = 0.0;
    }

    final bool siblingsExist = brothers > 0 || sisters > 0;
    final bool grandchildrenExist = grandsons > 0 || granddaughters > 0;
    final bool halfSiblingsExist = paternalBrothers > 0 || paternalSisters > 0;

    if (fatherAlive || sons > 0 || grandsons > 0 || daughters > 0) {
      shares['grandfather'] = 0.0;
    }
    if (grandfatherAlive) {
      shares['paternalBrothers'] = 0.0;
      shares['paternalSisters'] = 0.0;
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullNephews'] = 0.0;
      shares['paternalNephews'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
    }

    if (motherAlive || fatherAlive || sons > 0 || daughters > 0 || grandsons > 0 || granddaughters > 0 || siblingsExist) {
      shares['maternalGrandmother'] = 0.0;
      shares['paternalGrandmother'] = 0.0;
    }

    if (maternalGrandmotherAlive && !motherAlive && !fatherAlive && sons == 0 && daughters == 0 && grandsons == 0 && granddaughters == 0 && !siblingsExist && !halfSiblingsExist) {
      shares['maternalGrandmother'] = 1 / 6;
    }
    if (paternalGrandmotherAlive && !motherAlive && !fatherAlive && sons == 0 && daughters == 0 && grandsons == 0 && granddaughters == 0 && !siblingsExist && !halfSiblingsExist) {
      shares['paternalGrandmother'] = 1 / 6;
    }

    fixedTotal = 0.0;
    shares.forEach((key, value) => fixedTotal += value);
    residue = 1.0 - fixedTotal;

    if (grandfatherAlive && !fatherAlive && !motherAlive && sons == 0 && daughters == 0 && grandsons == 0 && granddaughters == 0 && !siblingsExist && !halfSiblingsExist && residue > 0) {
      shares['grandfather'] = residue;
      residue = 0.0;
    }

    final bool noParents = !motherAlive && !fatherAlive;
    final bool noChildrenOrGrandchildren = sons == 0 && daughters == 0 && grandsons == 0 && granddaughters == 0;

    if (noParents && noChildrenOrGrandchildren && !siblingsExist && !grandchildrenExist) {
      if (maternalGrandmotherAlive && paternalGrandmotherAlive) {
        shares['maternalGrandmother'] = 1 / 12;
        shares['paternalGrandmother'] = 1 / 12;
      } else if (maternalGrandmotherAlive) {
        shares['maternalGrandmother'] = 1 / 6;
      } else if (paternalGrandmotherAlive) {
        shares['paternalGrandmother'] = 1 / 6;
      }
    }

    if (husbandAlive && wives == 0 && !fatherAlive && !motherAlive && sons == 0 && daughters == 0 && brothers == 0 && sisters == 0 && grandsons == 0 && granddaughters == 0 && maternalGrandmotherAlive && paternalGrandmotherAlive && grandfatherAlive) {
      shares['husband'] = 1 / 2;
      shares['maternalGrandmother'] = 1 / 12;
      shares['paternalGrandmother'] = 1 / 12;
      shares['grandfather'] = 1.0 - (1 / 2 + 1 / 12 + 1 / 12);
      residue = 0.0;
    }

    if (wives > 0 && !husbandAlive && sons == 0 && daughters == 0 && brothers == 0 && sisters == 0 && grandsons == 0 && granddaughters == 0 && !fatherAlive && !motherAlive && maternalGrandmotherAlive && paternalGrandmotherAlive && grandfatherAlive) {
      shares['wives'] = 1 / 4;
      shares['maternalGrandmother'] = 1 / 12;
      shares['paternalGrandmother'] = 1 / 12;
      shares['grandfather'] = 1.0 - (1 / 4 + 1 / 12 + 1 / 12);
      residue = 0.0;
    }

    fixedTotal = 0.0;
    shares.forEach((key, value) => fixedTotal += value);
    residue = 1.0 - fixedTotal;

    if (grandfatherAlive && !fatherAlive && sons == 0 && daughters == 0 && grandsons == 0 && residue > 0 && !siblingsExist && !grandchildrenExist) {
      shares['grandfather'] = residue;
      residue = 0.0;
    }

    final bool onlyGrandparents = grandfatherAlive && !fatherAlive && !motherAlive && sons == 0 && daughters == 0 && grandsons == 0 && granddaughters == 0 && brothers == 0 && sisters == 0 && !husbandAlive && wives == 0;
    if (onlyGrandparents) {
      if (maternalGrandmotherAlive && paternalGrandmotherAlive) {
        shares['maternalGrandmother'] = 1 / 12;
        shares['paternalGrandmother'] = 1 / 12;
        shares['grandfather'] = 5 / 6;
      } else if (maternalGrandmotherAlive) {
        shares['maternalGrandmother'] = 1 / 6;
        shares['grandfather'] = 5 / 6;
      } else if (paternalGrandmotherAlive) {
        shares['paternalGrandmother'] = 1 / 6;
        shares['grandfather'] = 5 / 6;
      } else {
        shares['grandfather'] = 1.0;
      }
    }

    if (sons > 0 || grandsons > 0 || fatherAlive || brothers > 0) {
      shares['paternalBrothers'] = 0.0;
    }
    if (paternalBrothers > 0) {
      shares['maternalBrothers'] = 0.0;
      shares['maternalSisters'] = 0.0;
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
    }

    if (sons > 0 || grandsons > 0 || fatherAlive || brothers > 0 || sisters > 0 || grandfatherAlive) {
      shares['paternalSisters'] = 0.0;
    }
    if (paternalSisters > 0) {
      shares['maternalBrothers'] = 0.0;
      shares['maternalSisters'] = 0.0;
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
    }

    if (sons > 0 || daughters > 0 || fatherAlive || brothers > 0 || sisters > 0 || grandfatherAlive || grandsons > 0 || paternalBrothers > 0 || paternalSisters > 0) {
      shares['maternalBrothers'] = 0.0;
    }
    if (maternalBrothers > 0) {
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
    }

    if (sons > 0 || daughters > 0 || fatherAlive || grandfatherAlive || brothers > 0 || paternalUncles > 0 || paternalBrothers > 0 || paternalSisters > 0) {
      shares['maternalSisters'] = 0.0;
    }
    if (maternalSisters > 0) {
      shares['fullCousins'] = 0.0;
      shares['paternalCousins'] = 0.0;
    }

    double baytulmalShare = 0.0;
    final bool paternalSiblingsExist = paternalBrothers > 0 || paternalSisters > 0;
    final bool maternalSiblingsExist = maternalBrothers > 0 || maternalSisters > 0;

    if (maternalSiblingsExist && !paternalSiblingsExist && !motherAlive && !fatherAlive && sons == 0 && daughters == 0 && grandsons == 0 && granddaughters == 0 && !grandfatherAlive) {
      int totalMaternalSiblings = maternalBrothers + maternalSisters;
      double maternalShare = 1 / 6;

      shares['maternalBrothers'] = (maternalBrothers / totalMaternalSiblings) * maternalShare;
      shares['maternalSisters'] = (maternalSisters / totalMaternalSiblings) * maternalShare;

      residue = 1.0 - maternalShare;
      baytulmalShare = residue;
      residue = 0.0;
    }

    if (paternalSiblingsExist && !fatherAlive && sons == 0 && daughters == 0 && grandsons == 0 && brothers == 0 && sisters == 0 && !grandfatherAlive) {
      double totalAvailableEstate = 1.0 - shares.values.reduce((sum, val) => sum + val);
      double estateToDistribute = totalAvailableEstate > 0 ? totalAvailableEstate : 1.0;

      int totalPaternalUnits = (paternalBrothers * 2) + paternalSisters;
      double unitShare = estateToDistribute / totalPaternalUnits;

      shares['paternalBrothers'] = 2 * unitShare * paternalBrothers;
      shares['paternalSisters'] = unitShare * paternalSisters;

      shares['maternalBrothers'] = 0.0;
      shares['maternalSisters'] = 0.0;
      residue = 0.0;
    }

    if (grandfatherAlive && !fatherAlive && sons == 0 && grandsons == 0 && brothers == 0 && paternalBrothers == 0 && fullNephews == 0 && paternalNephews == 0 && fullUncles == 0 && paternalUncles == 0 && residue > 0) {
      shares['grandfather'] = (shares['grandfather'] ?? 0.0) + residue;
      residue = 0.0;
    }

    fixedTotal = shares.values.reduce((sum, val) => sum + val);
    residue = 1.0 - fixedTotal;
    if (residue < 0) residue = 0.0;

    final bool closerAgnatesBlockUncles = fatherAlive || grandfatherAlive || sons > 0 || grandsons > 0 || brothers > 0 || paternalBrothers > 0 || fullNephews > 0 || paternalNephews > 0 || sisters > 0 || paternalSisters > 0;

    if (closerAgnatesBlockUncles) {
      shares['fullUncles'] = 0.0;
      shares['paternalUncles'] = 0.0;
    } else {
      if (fullUncles > 0 && residue > 0) {
        shares['fullUncles'] = residue;
        shares['paternalUncles'] = 0.0;
        residue = 0.0;
      } else if (paternalUncles > 0 && residue > 0) {
        shares['fullUncles'] = 0.0;
        shares['paternalUncles'] = residue;
        residue = 0.0;
      } else {
        shares['fullUncles'] = 0.0;
        shares['paternalUncles'] = 0.0;
      }
    }

    return InheritanceResult(shares: shares, baytulmal: baytulmalShare);
  }
}