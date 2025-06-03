import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/data/providers/do_the_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewTempProgressTempTrainProvider =
    FutureProvider.family<List<ExerciseModel>, TempTrainModel>(
        (ref, train) async {
  final dataRepo = ref.read(doTheTrainDataProvider);
  return await dataRepo.getProgressTempTrain(
      exercisesList: train.getExercise());
});
