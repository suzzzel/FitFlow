import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoutOfRepsInfoInViewProgress extends StatelessWidget {
  const CoutOfRepsInfoInViewProgress(
      {super.key, required this.coutOfRepInThatExercise});

  final String? coutOfRepInThatExercise;

  @override
  Widget build(BuildContext context) {
    return Text('Количество подходов: $coutOfRepInThatExercise',
        style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary));
  }
}
