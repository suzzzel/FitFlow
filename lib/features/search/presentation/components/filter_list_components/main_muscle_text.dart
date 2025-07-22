import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMuscleFilterText extends StatelessWidget {
  const MainMuscleFilterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Целевая мышца',
      style: GoogleFonts.inter(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    ));
  }
}
