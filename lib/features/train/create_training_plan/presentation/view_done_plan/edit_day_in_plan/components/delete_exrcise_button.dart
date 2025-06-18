import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteExercisesInDayButton extends ConsumerWidget {
  const DeleteExercisesInDayButton({
    super.key,
    required this.weekday,
    required this.exercises,
  });

  final String weekday;
  final ExerciseModel exercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 36,
        maxHeight: 36,
      ),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(184, 45, 45, 1),
          borderRadius: BorderRadius.circular(20)),
      child: FittedBox(
        child: IconButton(
            onPressed: () {
              ref
                  .read(tempTrainPlanProvider.notifier)
                  .deleteExercise(weekday: weekday, exercise: exercises);
            },
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.white,
            )),
      ),
    );
  }
}
