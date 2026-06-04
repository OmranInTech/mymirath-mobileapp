import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mymirath/features/calculator/presentation/state/calculation_model.dart';

class PrimaryHeirsSection extends StatelessWidget {
  const PrimaryHeirsSection({super.key});

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
              'Primary Heirs',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
            ),

            const Divider(height: 24),

            DropdownButtonFormField<String>(
              value: state.madhhab,
              decoration: const InputDecoration(
                labelText: 'Madhhab',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'hanafi',
                  child: Text('Hanafi'),
                ),
                DropdownMenuItem(
                  value: 'shafi',
                  child: Text('Shafi'),
                ),
                DropdownMenuItem(
                  value: 'maliki',
                  child: Text('Maliki'),
                ),
                DropdownMenuItem(
                  value: 'hanbali',
                  child: Text('Hanbali'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  state.updateField('madhhab', value);
                }
              },
            ),

            const SizedBox(height: 16),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Husband Alive'),
              value: state.husbandAlive,
              onChanged: (value) {
                state.updateField('husbandAlive', value);
              },
            ),

            if (!state.husbandAlive)
              _buildWivesCounter(
                state.wives,
                (value) => state.updateField('wives', value),
              ),

            const Divider(height: 24),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Mother Alive'),
              value: state.motherAlive,
              onChanged: (value) {
                state.updateField('motherAlive', value);
              },
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Father Alive'),
              value: state.fatherAlive,
              onChanged: (value) {
                state.updateField('fatherAlive', value);
              },
            ),

            const Divider(height: 24),

            _buildCounter(
              'Sons',
              state.sons,
              (value) => state.updateField('sons', value),
            ),

            _buildCounter(
              'Daughters',
              state.daughters,
              (value) => state.updateField('daughters', value),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: value > 0
                    ? () => onChanged(value - 1)
                    : null,
              ),
              Text(
                '$value',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () => onChanged(value + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWivesCounter(
    int value,
    ValueChanged<int> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Number of Wives',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: value > 0
                    ? () => onChanged(value - 1)
                    : null,
              ),
              Text(
                '$value',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: value < 4
                    ? () => onChanged(value + 1)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}