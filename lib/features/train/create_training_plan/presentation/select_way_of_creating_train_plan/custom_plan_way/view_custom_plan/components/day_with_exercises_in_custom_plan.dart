import 'dart:io';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/edit_this_day_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/exercises_row_func.dart';
import 'package:flutter/material.dart';

class DayWithExercisesInCustomPlan extends StatelessWidget {
  const DayWithExercisesInCustomPlan(
      {super.key,
      required this.thisDay,
      required this.context,
      required this.dir,
      required this.exercises,
      required this.weekday});
  final List<String?> thisDay;
  final String weekday;
  final List<ExerciseModel> exercises;
  final Directory dir;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: _buildDayExercisesInCustomPlan(
            thisDay: thisDay,
            weekday: weekday,
            exercises: exercises,
            dir: dir,
            context: context));
  }
}

Widget _buildDayExercisesInCustomPlan({
  required List<String?> thisDay,
  required String weekday,
  required List<ExerciseModel> exercises,
  required Directory dir,
  required BuildContext context,
}) {
  final thisDayList = List<String?>.generate(
      5, (index) => index < thisDay.length ? thisDay[index] : null);
  return Padding(
    padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        exercisesRow(
            dayExercises: thisDayList.sublist(0, 3),
            exercises: exercises,
            dir: dir,
            firstLine: true,
            context: context),
        exercisesRow(
            dayExercises: thisDayList.sublist(3),
            exercises: exercises,
            firstLine: false,
            dir: dir,
            context: context),
        EditThisDayButton(
          weekday: weekday,
          dir: dir,
          isThisViewReadyOrCustomPlan: false,
        )
      ],
    ),
  );
}
