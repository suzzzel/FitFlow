import 'dart:io';

import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:flutter/material.dart';

class ExerciseImageInSearch extends StatelessWidget {
  const ExerciseImageInSearch({
    super.key,
    required this.exGifFile,
  });

  final File exGifFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: ExerciseImage(
            exGifFile: exGifFile,
            heightinDetailView: MediaQuery.of(context).size.height * 0.31,
            widthInDetailView: double.maxFinite),
      ),
    );
  }
}
