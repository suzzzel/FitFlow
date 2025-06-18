import 'package:fitflow/features/general_comonents/exercise_model.dart';

abstract class SearchExercisesRepoImpl {
  Future<List<ExerciseModel>> searchExercisesByUserRequest({
    required String nameOfExercise,
    required int numberOfPage,
    required bool usingFilter,
    String bodyPartFilter,
    String targetMuscleFilter,
    String equipment,
  });
}
