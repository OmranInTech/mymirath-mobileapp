class PrimaryHeirsSection extends StatelessWidget {
  final HeirsInput input;
  final Function(HeirsInput) onChanged;

  const PrimaryHeirsSection({
    super.key,
    required this.input,
    required this.onChanged,
  });

  void update({
    int? sons,
    int? daughters,
    bool? fatherAlive,
    bool? motherAlive,
    int? wives,
  }) {
    onChanged(input.copyWith(
      sons: sons ?? input.sons,
      daughters: daughters ?? input.daughters,
      fatherAlive: fatherAlive ?? input.fatherAlive,
      motherAlive: motherAlive ?? input.motherAlive,
      wives: wives ?? input.wives,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Primary Heirs",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

        const SizedBox(height: 10),

        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Sons"),
          onChanged: (v) => update(sons: int.tryParse(v) ?? 0),
        ),

        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Daughters"),
          onChanged: (v) => update(daughters: int.tryParse(v) ?? 0),
        ),

        SwitchListTile(
          title: const Text("Father Alive"),
          value: input.fatherAlive,
          onChanged: (v) => update(fatherAlive: v),
        ),

        SwitchListTile(
          title: const Text("Mother Alive"),
          value: input.motherAlive,
          onChanged: (v) => update(motherAlive: v),
        ),

        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Wives"),
          onChanged: (v) => update(wives: int.tryParse(v) ?? 0),
        ),
      ],
    );
  }
}