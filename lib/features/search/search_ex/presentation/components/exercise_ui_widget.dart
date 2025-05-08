import 'dart:io';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:flutter/material.dart';

class ExerciseSearchWidget extends StatelessWidget {
  const ExerciseSearchWidget(
      {super.key,
      required this.exGifFile,
      required this.dir,
      required this.exercise});

  final File exGifFile;
  final Directory dir;
  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExerciseImage(exGifFile: exGifFile),
            Text(
              exercise.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
