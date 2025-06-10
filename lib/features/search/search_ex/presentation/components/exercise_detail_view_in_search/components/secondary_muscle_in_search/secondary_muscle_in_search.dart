import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/components/secondary_muscle_in_search/components/secondary_muscle_first.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/components/secondary_muscle_in_search/components/secondary_muscle_second.dart';
import 'package:flutter/material.dart';

class SecondaryMuscleInSearch extends StatelessWidget {
  const SecondaryMuscleInSearch({
    super.key,
    required this.secondaryMuscles,
  });

  final List<String> secondaryMuscles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            color: Colors.grey.withOpacity(0.3)),
        child: Column(
          children: [
            const SecondaryMuscleFirst(),
            SecondaryMuscleSecond(secondaryMuscles: secondaryMuscles)
          ],
        ),
      ),
    );
  }
}
