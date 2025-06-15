import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitingCompleteExercise extends StatelessWidget {
  const WaitingCompleteExercise({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Ждем завершения упражнения',
        style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary));
  }
}
