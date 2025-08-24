import 'package:fitflow/features/general_comonents/exercise_model.dart';

abstract class HomeDataImpl {
  Future<Map<String, List<ExerciseModel>>> getExerciseInTrainingPlan();
}
