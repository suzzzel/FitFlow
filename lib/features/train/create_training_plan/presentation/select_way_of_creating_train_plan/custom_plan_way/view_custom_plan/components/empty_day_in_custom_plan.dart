import 'dart:io';

import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/add_another_exercise_button.dart';
import 'package:flutter/material.dart';

class EmptyDayInCustomPlan extends StatelessWidget {
  const EmptyDayInCustomPlan(
      {super.key, required this.directory, required this.weekday});
  final Directory directory;
  final String weekday;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AddExerciseButton(
        dir: directory,
        weekday: weekday,
      ),
    );
  }
}
