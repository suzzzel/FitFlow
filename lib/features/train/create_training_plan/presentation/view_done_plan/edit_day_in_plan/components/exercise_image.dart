import 'dart:io';

import 'package:flutter/material.dart';

class ExerciseImage extends StatelessWidget {
  const ExerciseImage({
    super.key,
    required this.exGifFile,
  });

  final File exGifFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed.withOpacity(0.4),
              Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.4),
            ]).createShader(bounds),
            child: Image.file(
              exGifFile,
              width: 65,
              height: 65,
            ),
          ),
        ),
      ),
    );
  }
}
