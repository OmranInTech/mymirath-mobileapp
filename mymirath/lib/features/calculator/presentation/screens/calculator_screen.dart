import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/calculation_model.dart';
import '../widgets/primary_heirs_section.dart';
import '../widgets/dhaw_al_arham_section.dart';
import '../widgets/result_table.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CalculationModel>().triggerCalculation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Islamic Inheritance Calculator'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              ResultTable(),
              SizedBox(height: 20),
              PrimaryHeirsSection(),
              SizedBox(height: 20),
              DhawAlArhamSection(),
            ],
          ),
        ),
      ),
    );
  }
}