import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveFilterText extends StatelessWidget {
  const SaveFilterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Сохранить',
      style: GoogleFonts.inter(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}
