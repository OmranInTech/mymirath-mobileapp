import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mymirath/features/calculator/domain/calculation_model.dart';

class DhawAlArhamSection extends StatelessWidget {
  const DhawAlArhamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalculationModel>();

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Extended Heirs & Siblings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
            ),
            const SizedBox(height: 8),
            const Divider(),

            SwitchListTile(
              title: const Text('Grandfather Alive'),
              value: state.grandfatherAlive,
              onChanged: (v) =>
                  state.updateField('grandfatherAlive', v),
            ),

            SwitchListTile(
              title: const Text('Maternal Grandmother Alive'),
              value: state.maternalGrandmotherAlive,
              onChanged: (v) =>
                  state.updateField('maternalGrandmotherAlive', v),
            ),

            SwitchListTile(
              title: const Text('Paternal Grandmother Alive'),
              value: state.paternalGrandmotherAlive,
              onChanged: (v) =>
                  state.updateField('paternalGrandmotherAlive', v),
            ),

            const Divider(),

            _buildCounter(
              'Grandsons',
              state.grandsons,
              (v) => state.updateField('grandsons', v),
            ),

            _buildCounter(
              'Granddaughters',
              state.granddaughters,
              (v) => state.updateField('granddaughters', v),
            ),

            const Divider(),

            _buildCounter(
              'Full Brothers',
              state.brothers,
              (v) => state.updateField('brothers', v),
            ),

            _buildCounter(
              'Full Sisters',
              state.sisters,
              (v) => state.updateField('sisters', v),
            ),

            _buildCounter(
              'Paternal Brothers',
              state.paternalBrothers,
              (v) => state.updateField('paternalBrothers', v),
            ),

            _buildCounter(
              'Paternal Sisters',
              state.paternalSisters,
              (v) => state.updateField('paternalSisters', v),
            ),

            _buildCounter(
              'Maternal Brothers',
              state.maternalBrothers,
              (v) => state.updateField('maternalBrothers', v),
            ),

            _buildCounter(
              'Maternal Sisters',
              state.maternalSisters,
              (v) => state.updateField('maternalSisters', v),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(
    String label,
    int value,
    ValueChanged<int> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: value > 0 ? () => onChanged(value - 1) : null,
              ),
              Text(
                '$value',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => onChanged(value + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}