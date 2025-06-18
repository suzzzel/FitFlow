import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameOfExInViewProgress extends StatelessWidget {
  const NameOfExInViewProgress({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name.substring(0, 1).toUpperCase() + name.substring(1),
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary));
  }
}
