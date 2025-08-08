// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';

class ProgressInDayModel {
  List<ExercisesIntoDayModel> exercise;
  ProgressInDayModel({
    required this.exercise,
  });

  int countOfExerciseInDay() {
    int returnedCount = 0;
    for (var x in exercise) {
      if (x.countOfReps > 0) {
        returnedCount = returnedCount + 1;
      } else {
        continue;
      }
    }
    return returnedCount;
  }
}
