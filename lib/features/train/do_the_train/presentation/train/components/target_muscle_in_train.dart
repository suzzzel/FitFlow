import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TargetMuscleInTrain extends StatelessWidget {
  const TargetMuscleInTrain({super.key, required this.targetMuscle});

  final String targetMuscle;
  @override
  Widget build(BuildContext context) {
    final shader = LinearGradient(colors: [
      Theme.of(context).colorScheme.primaryFixed,
      Theme.of(context).colorScheme.secondaryFixed,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primaryFixed.withOpacity(0.15),
                  Theme.of(context)
                      .colorScheme
                      .secondaryFixed
                      .withOpacity(0.15),
                ]),
            borderRadius: BorderRadius.circular(24)),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Главная мышца:',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSecondary),
                children: [
                  TextSpan(
                      text: ' $targetMuscle',
                      style: GoogleFonts.inter(
                        foreground: Paint()..shader = shader,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
                ])),
      ),
    );
  }
}
