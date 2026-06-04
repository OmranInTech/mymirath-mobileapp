import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mymirath/features/calculator/presentation/state/calculation_model.dart';

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
              onChanged: (value) =>
                  state.updateField('grandfatherAlive', value),
            ),

            SwitchListTile(
              title: const Text('Maternal Grandmother Alive'),
              value: state.maternalGrandmotherAlive,
              onChanged: (value) =>
                  state.updateField('maternalGrandmotherAlive', value),
            ),

            SwitchListTile(
              title: const Text('Paternal Grandmother Alive'),
              value: state.paternalGrandmotherAlive,
              onChanged: (value) =>
                  state.updateField('paternalGrandmotherAlive', value),
            ),

            const Divider(),

            _buildCounter(
              'Grandsons',
              state.grandsons,
              (value) => state.updateField('grandsons', value),
            ),

            _buildCounter(
              'Granddaughters',
              state.granddaughters,
              (value) => state.updateField('granddaughters', value),
            ),

            const Divider(),

            _buildCounter(
              'Full Brothers',
              state.brothers,
              (value) => state.updateField('brothers', value),
            ),

            _buildCounter(
              'Full Sisters',
              state.sisters,
              (value) => state.updateField('sisters', value),
            ),

            _buildCounter(
              'Paternal Brothers',
              state.paternalBrothers,
              (value) => state.updateField('paternalBrothers', value),
            ),

            _buildCounter(
              'Paternal Sisters',
              state.paternalSisters,
              (value) => state.updateField('paternalSisters', value),
            ),

            _buildCounter(
              'Maternal Brothers',
              state.maternalBrothers,
              (value) => state.updateField('maternalBrothers', value),
            ),

            _buildCounter(
              'Maternal Sisters',
              state.maternalSisters,
              (value) => state.updateField('maternalSisters', value),
            ),

            const Divider(),

            _buildCounter(
              'Full Nephews',
              state.fullNephews,
              (value) => state.updateField('fullNephews', value),
            ),

            _buildCounter(
              'Paternal Nephews',
              state.paternalNephews,
              (value) => state.updateField('paternalNephews', value),
            ),

            _buildCounter(
              'Full Uncles',
              state.fullUncles,
              (value) => state.updateField('fullUncles', value),
            ),

            _buildCounter(
              'Paternal Uncles',
              state.paternalUncles,
              (value) => state.updateField('paternalUncles', value),
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
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed:
                    value > 0 ? () => onChanged(value - 1) : null,
              ),
              Text(
                '$value',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
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