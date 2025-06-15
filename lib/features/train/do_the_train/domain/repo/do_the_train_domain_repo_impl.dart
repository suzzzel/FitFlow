import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';

abstract class DoTheTrainDomainRepoImpl {
  Future<void> startTrain();
  Future<bool> completeTrainAndExit({required TempTrainModel train});
  Future<void> nextExercise({required TempTrainModel train});
  Future<bool> exitFromTrainWithoutSaving();
  Future<void> exitFromTrainingWhenAppCrash();
}
