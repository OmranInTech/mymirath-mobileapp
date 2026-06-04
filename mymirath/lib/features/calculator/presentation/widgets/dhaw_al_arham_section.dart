import 'package:flutter/material.dart';
import '../../domain/calculation_model.dart';

class DhawuAlArhamSection extends StatefulWidget {
  final HeirsInput input;
  final Function(HeirsInput) onChanged;

  const DhawuAlArhamSection({
    super.key,
    required this.input,
    required this.onChanged,
  });

  @override
  State<DhawuAlArhamSection> createState() => _DhawuAlArhamSectionState();
}

class _DhawuAlArhamSectionState extends State<DhawuAlArhamSection> {
  bool open = false;

  void update(HeirsInput newInput) {
    widget.onChanged(newInput);
  }

  @override
  Widget build(BuildContext context) {
    final input = widget.input;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER =================
            GestureDetector(
              onTap: () => setState(() => open = !open),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dhawu al-Arham (Distant Kindred)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
            ),

            if (!open) const SizedBox(height: 0),

            if (open) ...[
              const SizedBox(height: 12),

              // ================= GRANDPARENTS =================
              const Text("Grandparents", style: TextStyle(fontWeight: FontWeight.bold)),

              SwitchListTile(
                title: const Text("Grandfather Alive"),
                value: input.grandfatherAlive,
                onChanged: (v) {
                  update(input.copyWith(grandfatherAlive: v));
                },
              ),

              SwitchListTile(
                title: const Text("Maternal Grandmother Alive"),
                value: input.maternalGrandmotherAlive,
                onChanged: (v) {
                  update(input.copyWith(maternalGrandmotherAlive: v));
                },
              ),

              SwitchListTile(
                title: const Text("Paternal Grandmother Alive"),
                value: input.paternalGrandmotherAlive,
                onChanged: (v) {
                  update(input.copyWith(paternalGrandmotherAlive: v));
                },
              ),

              const Divider(),

              // ================= SIBLINGS =================
              const Text("Siblings", style: TextStyle(fontWeight: FontWeight.bold)),

              TextFormField(
                initialValue: input.maternalBrothers.toString(),
                decoration: const InputDecoration(labelText: "Maternal Brothers"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    maternalBrothers: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              TextFormField(
                initialValue: input.maternalSisters.toString(),
                decoration: const InputDecoration(labelText: "Maternal Sisters"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    maternalSisters: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              TextFormField(
                initialValue: input.paternalBrothers.toString(),
                decoration: const InputDecoration(labelText: "Paternal Brothers"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    paternalBrothers: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              TextFormField(
                initialValue: input.paternalSisters.toString(),
                decoration: const InputDecoration(labelText: "Paternal Sisters"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    paternalSisters: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              const Divider(),

              // ================= NEPHEWS =================
              const Text("Nephews", style: TextStyle(fontWeight: FontWeight.bold)),

              TextFormField(
                initialValue: input.fullNephews.toString(),
                decoration: const InputDecoration(labelText: "Full Nephews"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    fullNephews: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              TextFormField(
                initialValue: input.paternalNephews.toString(),
                decoration: const InputDecoration(labelText: "Paternal Nephews"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    paternalNephews: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              const Divider(),

              // ================= UNCLES =================
              const Text("Uncles", style: TextStyle(fontWeight: FontWeight.bold)),

              TextFormField(
                initialValue: input.fullUncles.toString(),
                decoration: const InputDecoration(labelText: "Full Uncles"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    fullUncles: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              TextFormField(
                initialValue: input.paternalUncles.toString(),
                decoration: const InputDecoration(labelText: "Paternal Uncles"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    paternalUncles: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              const Divider(),

              // ================= COUSINS =================
              const Text("Cousins", style: TextStyle(fontWeight: FontWeight.bold)),

              TextFormField(
                initialValue: input.fullCousins.toString(),
                decoration: const InputDecoration(labelText: "Full Cousins"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    fullCousins: int.tryParse(v) ?? 0,
                  ));
                },
              ),

              TextFormField(
                initialValue: input.paternalCousins.toString(),
                decoration: const InputDecoration(labelText: "Paternal Cousins"),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  update(input.copyWith(
                    paternalCousins: int.tryParse(v) ?? 0,
                  ));
                },
              ),
            ]
          ],
        ),
      ),
    );
  }
}