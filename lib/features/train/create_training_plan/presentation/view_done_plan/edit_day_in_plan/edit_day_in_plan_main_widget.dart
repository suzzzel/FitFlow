import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditDayInPlanMainWidget extends ConsumerWidget {
  final String weekday;
  const EditDayInPlanMainWidget({super.key, required this.weekday});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempTrainProv = ref.watch(tempTrainPlanProvider);
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        final exercises = tempTrainProv.exercisesByWeekday[weekday];
        if (exercises!.length - 1 < index) {
          return ElevatedButton(
              onPressed: () {
                ref.read(tempTrainPlanProvider.notifier).addExercise(
                    weekday: weekday,
                    exercise: ExerciseModel(
                        id: 9,
                        bodyPart: 'талия',
                        equipment: 'медицинский мяч',
                        name: 'скручивания с мячом',
                        target: 'прэсс'));
              },
              child: Text('add'));
        } else {
          return Text(
            exercises[index].name,
            style: const TextStyle(color: Colors.white),
          );
        }
      },
    );
  }
}
