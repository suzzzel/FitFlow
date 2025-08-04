import 'dart:io';

import 'package:flutter/material.dart';

class GifExerciseInProgress extends StatelessWidget {
  const GifExerciseInProgress({super.key, required this.gif});

  final File gif;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, left: 16),
      child: SizedBox(
        width: 77,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: gif.existsSync()
              ? Image.file(
                  gif,
                )
              : Image.asset(
                  'assets/home/gif_error.gif',
                ),
        ),
      ),
    );
  }
}
