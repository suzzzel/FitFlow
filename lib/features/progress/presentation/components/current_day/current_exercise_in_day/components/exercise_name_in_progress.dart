import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseNameInMainProgress extends StatelessWidget {
  const ExerciseNameInMainProgress({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700));
  }
}
