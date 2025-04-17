import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';

abstract class CreateTrainingPlanDomainRepoImpl {
  Future<Map<int, List<ReadyTrainingPlanModel>>> getReadyTrainingPlans();

  Future<List<ExerciseModel>> getInfoAboutTempExercisesReadyPlan(
      {required String idTrainingPlan});
}
