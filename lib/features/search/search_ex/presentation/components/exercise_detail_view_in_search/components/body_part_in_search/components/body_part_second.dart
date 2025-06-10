import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyPartSecond extends StatelessWidget {
  const BodyPartSecond({
    super.key,
    required this.bodyPart,
  });

  final String bodyPart;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        textAlign: TextAlign.center,
        bodyPart,
        style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
