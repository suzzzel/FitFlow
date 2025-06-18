import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/data/providers/do_the_train_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tempExerciseFutureProvider =
    FutureProvider.family<ExerciseModel, String>((ref, exerciseId) async {
  final dataRepo = ref.watch(doTheTrainDataProvider);
  return await dataRepo.getTempExercise(tempExerciseId: exerciseId);
});
