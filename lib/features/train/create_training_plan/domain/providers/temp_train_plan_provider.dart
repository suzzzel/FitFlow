import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/temp_train_plan_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempTrainPlanNotifier extends StateNotifier<TempTrainPlanModel> {
  TempTrainPlanNotifier() : super(TempTrainPlanModel(exercisesByWeekday: {}));

  void addExercise({required String weekday, required ExerciseModel exercise}) {
    final Map<String, List<ExerciseModel>> tempMap = state.exercisesByWeekday;
    if (tempMap[weekday] == null) {
      tempMap.update(weekday, (value) => [exercise],
          ifAbsent: () => [exercise]);
    } else {
      final newDay = tempMap[weekday]!;
      if (!newDay.contains(exercise)) {
        newDay.add(exercise);
        tempMap.update(weekday, (value) => newDay);
      }
      state = state.copyWith(exercisesByWeekday: tempMap);
    }
  }

  void deleteExercise(
      {required String weekday, required ExerciseModel exercise}) {
    final Map<String, List<ExerciseModel>> tempMap = state.exercisesByWeekday;
    if (tempMap[weekday]!.length != 1) {
      tempMap[weekday]!.removeWhere((item) => item == exercise);
    }

    state = state.copyWith(exercisesByWeekday: tempMap);
  }

  void reset() {
    state = TempTrainPlanModel(exercisesByWeekday: {});
  }
}

final tempTrainPlanProvider =
    StateNotifierProvider<TempTrainPlanNotifier, TempTrainPlanModel>((ref) {
  return TempTrainPlanNotifier();
});
