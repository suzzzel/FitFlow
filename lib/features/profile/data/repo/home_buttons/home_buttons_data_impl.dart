import 'package:fitflow/features/general_comonents/exercise_model.dart';

abstract class HomeButtonsDataImpl {
  Future<bool> deletePlan();

  Future<bool> editTrainPlan({required Map<String, List<ExerciseModel>> days});

  Future<Map<String, List<ExerciseModel>>> getTempTrainPlan();
}
