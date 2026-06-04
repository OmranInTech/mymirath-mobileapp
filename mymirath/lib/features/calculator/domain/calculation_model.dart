import 'package:flutter/material.dart';
import '../../domain/inheritance_engine.dart';

class CalculationModel extends ChangeNotifier {
  String _madhhab = 'hanafi';

  bool _husbandAlive = false;
  int _wives = 0;

  int _sons = 0;
  int _daughters = 0;

  bool _motherAlive = false;
  bool _fatherAlive = false;

  int _brothers = 0;
  int _sisters = 0;

  int _grandsons = 0;
  int _granddaughters = 0;

  bool _grandfatherAlive = false;
  bool _maternalGrandmotherAlive = false;
  bool _paternalGrandmotherAlive = false;

  int _maternalBrothers = 0;
  int _maternalSisters = 0;

  int _paternalBrothers = 0;
  int _paternalSisters = 0;

  int _fullNephews = 0;
  int _paternalNephews = 0;

  int _fullUncles = 0;
  int _paternalUncles = 0;

  int _fullCousins = 0;
  int _paternalCousins = 0;

  InheritanceResult? _currentResult;

  // =====================
  // GETTERS
  // =====================

  InheritanceResult? get currentResult => _currentResult;

  int get sons => _sons;
  int get daughters => _daughters;

  bool get fatherAlive => _fatherAlive;
  bool get motherAlive => _motherAlive;

  int get maternalBrothers => _maternalBrothers;
  int get maternalSisters => _maternalSisters;

  int get paternalBrothers => _paternalBrothers;
  int get paternalSisters => _paternalSisters;

  int get fullUncles => _fullUncles;
  int get paternalUncles => _paternalUncles;

  int get fullCousins => _fullCousins;
  int get paternalCousins => _paternalCousins;

  // =====================
  // UPDATE FIELDS
  // =====================

  void updateField(String field, dynamic value) {
    switch (field) {
      case 'sons':
        _sons = value;
        break;

      case 'daughters':
        _daughters = value;
        break;

      case 'fatherAlive':
        _fatherAlive = value;
        break;

      case 'motherAlive':
        _motherAlive = value;
        break;

      case 'maternalBrothers':
        _maternalBrothers = value;
        break;

      case 'maternalSisters':
        _maternalSisters = value;
        break;

      case 'paternalBrothers':
        _paternalBrothers = value;
        break;

      case 'paternalSisters':
        _paternalSisters = value;
        break;

      case 'fullUncles':
        _fullUncles = value;
        break;

      case 'paternalUncles':
        _paternalUncles = value;
        break;

      case 'fullCousins':
        _fullCousins = value;
        break;

      case 'paternalCousins':
        _paternalCousins = value;
        break;
    }

    triggerCalculation();
  }

  // =====================
  // CALCULATE
  // =====================

  void triggerCalculation() {
    _currentResult = InheritanceEngine.calculateShares(
      wives: _wives,
      husbandAlive: _husbandAlive,
      sons: _sons,
      daughters: _daughters,
      motherAlive: _motherAlive,
      fatherAlive: _fatherAlive,
      brothers: _brothers,
      sisters: _sisters,
      grandsons: _grandsons,
      granddaughters: _granddaughters,
      grandfatherAlive: _grandfatherAlive,
      maternalGrandmotherAlive: _maternalGrandmotherAlive,
      paternalGrandmotherAlive: _paternalGrandmotherAlive,
      maternalBrothers: _maternalBrothers,
      maternalSisters: _maternalSisters,
      paternalBrothers: _paternalBrothers,
      paternalSisters: _paternalSisters,
      fullNephews: _fullNephews,
      paternalNephews: _paternalNephews,
      fullUncles: _fullUncles,
      paternalUncles: _paternalUncles,
      fullCousins: _fullCousins,
      paternalCousins: _paternalCousins,
      madhhab: _madhhab,
    );

    notifyListeners();
  }
}