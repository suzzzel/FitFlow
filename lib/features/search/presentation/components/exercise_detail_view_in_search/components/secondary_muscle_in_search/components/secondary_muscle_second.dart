import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryMuscleSecond extends StatelessWidget {
  const SecondaryMuscleSecond({
    super.key,
    required this.secondaryMuscles,
  });

  final List<String> secondaryMuscles;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: List.generate(
          secondaryMuscles.length,
          (int index) {
            if (index == secondaryMuscles.length - 1) {
              // Последняя вторичная мышца
              return Text(
                '${secondaryMuscles[index]}.',
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              );
            } else {
              // Любая другая по очереди мышца
              return Text(
                '${secondaryMuscles[index]}, ',
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              );
            }
          },
        ),
      ),
    );
  }
}
