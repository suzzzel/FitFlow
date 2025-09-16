import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempProgressHeader extends StatelessWidget {
  const TempProgressHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Текущий прогресс',
      textScaler: const TextScaler.linear(1),
      style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSecondary),
    );
  }
}
