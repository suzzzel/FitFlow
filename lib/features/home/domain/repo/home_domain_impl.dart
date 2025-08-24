import 'package:fitflow/features/general_comonents/exercise_model.dart';

abstract class HomeDomainImpl {
  Future<Map<String, List<ExerciseModel>>> getTempTrainPlan();
}
