import 'package:flutter/material.dart';
import '../../domain/calculation_model.dart';
import '../../domain/inheritance_engine.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final engine = InheritanceEngine();

  HeirsInput input = const HeirsInput();
  CalculationResult? result;

  double estate = 100000;

  bool dhawhOpen = false;

  void calculate() {
    setState(() {
      result = engine.calculate(
        input: input,
        estate: estate,
      );
    });
  }

  void reset() {
    setState(() {
      input = const HeirsInput();
      result = null;
      estate = 0;
    });
  }

  void updateInput(HeirsInput newInput) {
    setState(() {
      input = newInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyMirath Calculator"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Estate Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter estate amount",
              ),
              onChanged: (v) {
                estate = double.tryParse(v) ?? 0;
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Primary Heirs",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _numberField(
              label: "Sons",
              onChanged: (v) =>
                  updateInput(input.copyWith(sons: int.tryParse(v) ?? 0)),
            ),

            _numberField(
              label: "Daughters",
              onChanged: (v) => updateInput(
                  input.copyWith(daughters: int.tryParse(v) ?? 0)),
            ),

            SwitchListTile(
              title: const Text("Father Alive"),
              value: input.fatherAlive,
              onChanged: (v) =>
                  updateInput(input.copyWith(fatherAlive: v)),
            ),

            SwitchListTile(
              title: const Text("Mother Alive"),
              value: input.motherAlive,
              onChanged: (v) =>
                  updateInput(input.copyWith(motherAlive: v)),
            ),

            _numberField(
              label: "Wives",
              onChanged: (v) =>
                  updateInput(input.copyWith(wives: int.tryParse(v) ?? 0)),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () => setState(() => dhawhOpen = !dhawhOpen),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dhawu al-Arham",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(dhawhOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),

            if (dhawhOpen)
              Column(
                children: [

                  const SizedBox(height: 10),

                  _numberField(
                    label: "Maternal Brothers",
                    onChanged: (v) => updateInput(
                      input.copyWith(
                          maternalBrothers: int.tryParse(v) ?? 0),
                    ),
                  ),

                  _numberField(
                    label: "Maternal Sisters",
                    onChanged: (v) => updateInput(
                      input.copyWith(
                          maternalSisters: int.tryParse(v) ?? 0),
                    ),
                  ),

                  _numberField(
                    label: "Paternal Uncles",
                    onChanged: (v) => updateInput(
                      input.copyWith(
                          paternalUncles: int.tryParse(v) ?? 0),
                    ),
                  ),

                  // ✅ FIXED LINE (THIS WAS YOUR ERROR)
                  _numberField(
                    label: "Cousins",
                    onChanged: (v) => updateInput(
                      input.copyWith(
                          fullCousins: int.tryParse(v) ?? 0),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: calculate,
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: reset,
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (result != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Results",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  ...result!.shares.map((e) {
                    return ListTile(
                      title: Text(e.label),
                      trailing: Text(
                        "${(e.share * 100).toStringAsFixed(2)}%",
                      ),
                    );
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _numberField({
    required String label,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}