import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaxWeightInCurrentExerciseInMainProgress extends StatelessWidget {
  const MaxWeightInCurrentExerciseInMainProgress(
      {super.key, required this.weight});
  final String weight;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text('Максимальный вес: $weight кг',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
    );
  }
}
