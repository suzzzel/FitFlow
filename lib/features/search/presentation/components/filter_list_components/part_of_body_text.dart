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
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700)));
  }
}
