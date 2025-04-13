import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';

abstract class CreateTrainingPlanRepoImpl {
  Future<Map<int, List<ReadyTrainingPlanModel>>>
      getReadyTrainingPlansAndDownloadGifsEx();
  Future<List<ExerciseModel>> getInfoExercises(
      {required String trainingPlanId});

  Future<bool> confirmPlan({required List<ReadyTrainingPlanModel> days});
}
