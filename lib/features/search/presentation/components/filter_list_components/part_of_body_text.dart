import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyPartFilterText extends StatelessWidget {
  const BodyPartFilterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Часть тела',
            textScaler: const TextScaler.linear(1),
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700)));
  }
}
