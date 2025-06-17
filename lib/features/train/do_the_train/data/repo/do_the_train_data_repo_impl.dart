import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';

abstract class DoTheTrainDataRepoImpl {
  Future<void> startTrain();
  Future<bool> exitFromTrainWithoutSave();
  Future<ExerciseModel> getTempExercise({required String tempExerciseId});
  Future<bool> saveTrainEndExit({required TempTrainModel train});

  Future<void> nextExercise({required TempTrainModel train});
  Future<List<ExerciseModel>> getProgressTempTrain(
      {required List<String> exercisesList});
  Future<void> exitFromTrainWhenTrainIsOver();
}
