import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepNumberInTrainHeader extends StatelessWidget {
  const StepNumberInTrainHeader({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Шаг №$index',
        style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}
