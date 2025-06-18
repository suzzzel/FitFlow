import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseWasSkipped extends StatelessWidget {
  const ExerciseWasSkipped({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Упражнение было пропущено',
        style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.error));
  }
}
