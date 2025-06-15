import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoutOfRepsAndMaxWeightInfo extends StatelessWidget {
  const CoutOfRepsAndMaxWeightInfo({
    super.key,
    required this.countOfReps,
    required this.tempMaxWeight,
  });

  final int countOfReps;
  final String? tempMaxWeight;

  @override
  Widget build(BuildContext context) {
    final shader = LinearGradient(colors: [
      Theme.of(context).colorScheme.primaryFixed,
      Theme.of(context).colorScheme.secondaryFixed,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.15),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.15),
              ]),
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Кол-во подходов:\n',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSecondary),
                  children: [
                    TextSpan(
                        text: '$countOfReps',
                        style: GoogleFonts.inter(
                          foreground: Paint()..shader = shader,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        )),
                  ])),
          Icon(Icons.fitness_center,
              color: Theme.of(context).colorScheme.onSecondary),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Максим. вес:\n',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSecondary),
                  children: [
                    TextSpan(
                        text: tempMaxWeight != null
                            ? '$tempMaxWeight кг'
                            : 'не указан',
                        style: GoogleFonts.inter(
                          foreground: Paint()..shader = shader,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        )),
                  ]))
        ],
      ),
    );
  }
}
