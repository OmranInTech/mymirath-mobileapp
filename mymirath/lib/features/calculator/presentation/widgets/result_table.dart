import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mymirath/features/calculator/presentation/state/calculation_model.dart';

class ResultTable extends StatelessWidget {
  const ResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalculationModel>();
    final results = state.currentResult;

    if (results == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Modify input counts to view calculations dynamically.',
            ),
          ),
        ),
      );
    }

    final activeShares = results.shares.entries
        .where((e) => e.value > 0)
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calculation Results',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
            ),

            const SizedBox(height: 12),

            if (activeShares.isEmpty && results.baytulmal <= 0)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'No eligible heirs found to distribute assets.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            else
              Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Heir Relation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Share',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ...activeShares.map(
                    (entry) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            _formatHeirName(entry.key),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            '${(entry.value * 100).toStringAsFixed(2)}%',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (results.baytulmal > 0)
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Baytulmal (Public Treasury)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            '${(results.baytulmal * 100).toStringAsFixed(2)}%',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  String _formatHeirName(String key) {
    if (key.isEmpty) return '';

    final formatted = key.replaceAllMapped(
      RegExp(r'(?<=[a-z])[A-Z]'),
      (match) => ' ${match.group(0)}',
    );

    return formatted[0].toUpperCase() + formatted.substring(1);
  }
}