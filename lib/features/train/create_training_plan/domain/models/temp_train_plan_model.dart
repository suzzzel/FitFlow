// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fitflow/features/general_comonents/exercise_model.dart';

class TempTrainPlanModel {
  final Map<String, List<ExerciseModel>> exercisesByWeekday;
  TempTrainPlanModel({
    required this.exercisesByWeekday,
  });

  TempTrainPlanModel copyWith({
    Map<String, List<ExerciseModel>>? exercisesByWeekday,
  }) {
    return TempTrainPlanModel(
      exercisesByWeekday: exercisesByWeekday ?? this.exercisesByWeekday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exercisesByWeekday': exercisesByWeekday,
    };
  }

  @override
  String toString() =>
      'TempTrainPlanModel(exercisesByWeekday: $exercisesByWeekday)';

  @override
  bool operator ==(covariant TempTrainPlanModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.exercisesByWeekday, exercisesByWeekday);
  }

  @override
  int get hashCode => exercisesByWeekday.hashCode;
}
