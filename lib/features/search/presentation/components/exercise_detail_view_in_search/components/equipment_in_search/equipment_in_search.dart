import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/equipment_in_search/components/equipment_first.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/equipment_in_search/components/equipment_second.dart';
import 'package:flutter/material.dart';

class EquipmentInSearch extends StatelessWidget {
  const EquipmentInSearch({
    super.key,
    required this.equipment,
  });

  final String equipment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            color: Colors.grey.withOpacity(0.3)),
        child: Column(
          children: [
            const EquipmentFirst(),
            EquipmentSecond(equipment: equipment),
          ],
        ),
      ),
    );
  }
}
