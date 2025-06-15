import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameOfExerciseInTrain extends StatelessWidget {
  const NameOfExerciseInTrain({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
