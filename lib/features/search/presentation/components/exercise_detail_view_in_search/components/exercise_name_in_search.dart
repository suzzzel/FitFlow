import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseNameInSearch extends StatelessWidget {
  const ExerciseNameInSearch({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
