import 'package:fitflow/features/general_comonents/exercise_model.dart';

abstract class HomeButtonsDomainImpl {
  Future<bool> deleteTrainingPlan();

  Future<Map<String, List<ExerciseModel>>> getTempPlanToEdit();

  Future<bool> updateTrainPlan(
      {required Map<String, List<ExerciseModel>> plan});
}
