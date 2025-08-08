import 'package:fitflow/features/progress/presentation/components/current_day/current_exercise_in_day/components/count_of_reps_in_exercise.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/current_exercise_in_day/components/exercise_name_in_progress.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/current_exercise_in_day/components/max_weight_in_exercise.dart';
import 'package:flutter/material.dart';

class InfoAboutExerciseInProgress extends StatelessWidget {
  const InfoAboutExerciseInProgress(
      {super.key,
      required this.maxWeight,
      required this.name,
      required this.reps});

  final String name;
  final String reps;
  final String maxWeight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .onSecondaryFixed
                      .withOpacity(0.8),
                  Theme.of(context).colorScheme.onSecondaryFixed.withOpacity(0)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExerciseNameInMainProgress(name: name),
            CountOfRepsInCurrentExerciseInMainProgress(reps: reps),
            maxWeight != '0'
                ? MaxWeightInCurrentExerciseInMainProgress(
                    weight: maxWeight,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
