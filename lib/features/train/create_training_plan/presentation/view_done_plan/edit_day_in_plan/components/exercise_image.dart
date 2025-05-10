import 'dart:io';

import 'package:flutter/material.dart';

class ExerciseImage extends StatelessWidget {
  final double? widthInDetailView;
  final double? heightinDetailView;
  const ExerciseImage(
      {super.key,
      required this.exGifFile,
      required this.heightinDetailView,
      required this.widthInDetailView});

  final File exGifFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightinDetailView ?? 65,
      width: widthInDetailView ?? 65,
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
              width: widthInDetailView ?? 65,
              height: heightinDetailView ?? 65,
            ),
          ),
        ),
      ),
    );
  }
}
