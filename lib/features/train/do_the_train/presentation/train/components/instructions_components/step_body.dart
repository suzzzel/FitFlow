import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepInTrainBody extends StatelessWidget {
  const StepInTrainBody(
      {super.key, required this.instructions, required this.index});

  final List<String> instructions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textAlign: TextAlign.center,
        instructions[index],
        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
