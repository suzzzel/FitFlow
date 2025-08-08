import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';

abstract class MainProgressDomainImpl {
  Future<MainProgressModel> getMainProgress();

  Future<List<ExercisesIntoDayModel>> getProgressByDay(
      {required TrainingDayClass dayOfTrain});
}
