import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/data/providers/get_ready_plans_data_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/repo/create_training_plan_domain_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getInfoExercisesReadyPlanDataProvider =
    FutureProvider.family<List<ExerciseModel>, String>(
        (ref, idTrainingPlan) async {
  final dataRepo = ref.watch(readyPlansDataProvider);
  final domainToData =
      CreateTrainingPlanDomainRepo(createTrainingPlanRepo: dataRepo);
  final exercises = await domainToData.getInfoAboutTempExercisesReadyPlan(
      idTrainingPlan: idTrainingPlan);
  return exercises;
});
