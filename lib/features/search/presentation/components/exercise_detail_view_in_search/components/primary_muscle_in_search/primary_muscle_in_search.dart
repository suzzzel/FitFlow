import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/primary_muscle_in_search/components/primary_muscle_first.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/primary_muscle_in_search/components/primary_muscle_second.dart';
import 'package:flutter/material.dart';

class PrimaryMuscleInSearch extends StatelessWidget {
  const PrimaryMuscleInSearch({
    super.key,
    required this.target,
  });

  final String target;

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
            const PrimaryMuscleFirst(),
            PrimaryMuscleSecond(target: target),
          ],
        ),
      ),
    );
  }
}
