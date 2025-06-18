import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsSecond extends StatelessWidget {
  const InstructionsSecond({
    super.key,
    required this.instructions,
  });

  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        instructions.length,
        (int index) {
          if (index == instructions.length - 1) {
            // Последний этап по инструкции
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                    color: Colors.grey.withOpacity(0.3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        'Последний шаг',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(instructions[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            );
          } else {
            // Любой другой шаг в инструкции
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                    color: Colors.grey.withOpacity(0.3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        'Шаг ${index + 1}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      instructions[index],
                      style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
