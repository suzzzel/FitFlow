import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WholeInstructionsStepsHeader extends StatelessWidget {
  const WholeInstructionsStepsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: FittedBox(
          child: Text(
              textAlign: TextAlign.center,
              'Инструкция к выполнению',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
