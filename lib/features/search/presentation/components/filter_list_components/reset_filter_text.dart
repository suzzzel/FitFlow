import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetFilterText extends StatelessWidget {
  const ResetFilterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Сбросить',
      style: GoogleFonts.inter(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}
