import 'dart:math';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExerciseInPlanFromSearch extends ConsumerWidget {
  const AddExerciseInPlanFromSearch(
      {super.key,
      required this.weekday,
      required this.exerciseToAdd,
      required this.exerciseToDelete});

  final String? weekday;
  final ExerciseModel exerciseToAdd;
  final ExerciseModel? exerciseToDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(99)),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.error,
            Theme.of(context).colorScheme.errorContainer,
          ], transform: const GradientRotation(pi / 2))),
      child: ElevatedButton(
          onPressed: () async {
            if (exerciseToDelete != null) {
              ref.read(tempTrainPlanProvider.notifier).updateExercise(
                  weekday: weekday!,
                  exerciseToChange: exerciseToDelete!,
                  newExercise: exerciseToAdd);
            } else {
              ref
                  .read(tempTrainPlanProvider.notifier)
                  .addExercise(weekday: weekday!, exercise: exerciseToAdd);
            }
            context.pop();
            context.pop();
          },
          style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
          child: FittedBox(
            child: Text(
              exerciseToDelete == null ? 'Добавить' : 'Заменить',
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
