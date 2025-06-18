import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryMuscleFirst extends StatelessWidget {
  const SecondaryMuscleFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        'Вторичные мышцы',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
