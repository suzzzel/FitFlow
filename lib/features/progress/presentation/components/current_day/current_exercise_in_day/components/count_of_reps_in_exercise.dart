import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountOfRepsInCurrentExerciseInMainProgress extends StatelessWidget {
  const CountOfRepsInCurrentExerciseInMainProgress(
      {super.key, required this.reps});
  final String reps;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        'Количество подходов: $reps',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
      ),
    );
  }
}
