import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaxWeightInExercise extends StatelessWidget {
  const MaxWeightInExercise({super.key, required this.maxWeightOnThatExercise});

  final String? maxWeightOnThatExercise;

  @override
  Widget build(BuildContext context) {
    return Text(
        'Максимальный вес в кг: ${maxWeightOnThatExercise ?? 'не был указан'}',
        style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary));
  }
}
