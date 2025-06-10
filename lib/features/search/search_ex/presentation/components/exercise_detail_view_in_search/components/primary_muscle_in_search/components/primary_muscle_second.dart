import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryMuscleSecond extends StatelessWidget {
  const PrimaryMuscleSecond({
    super.key,
    required this.target,
  });

  final String target;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        target,
        style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
