import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/data/providers/get_ready_plans_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getInfoExercisesDataProvider =
    FutureProvider.family<List<ExerciseModel>, String>(
        (ref, idTrainingPlan) async {
  final exercises = await ref
      .read(getReadyPlansDataProvider)
      .getInfoExercises(trainingPlanId: idTrainingPlan);
  return exercises;
});
