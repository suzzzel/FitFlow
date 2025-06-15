import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondayMusclesInTrain extends StatelessWidget {
  const SecondayMusclesInTrain({
    super.key,
    required this.secondaryMuscles,
  });

  final List<String> secondaryMuscles;

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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: secondaryMuscles.isNotEmpty
              ? [
                  Text(
                    'Вторичные мышцы: ',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  ...List.generate(
                    secondaryMuscles.length,
                    (int index) {
                      if (index == secondaryMuscles.length - 1) {
                        return Text('${secondaryMuscles[index]}.',
                            style: GoogleFonts.inter(
                              foreground: Paint()..shader = shader,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ));
                      } else {
                        return Text('${secondaryMuscles[index]}, ',
                            style: GoogleFonts.inter(
                              foreground: Paint()..shader = shader,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ));
                      }
                    },
                  )
                ]
              : [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Второстепенные мышцы ',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onSecondary),
                          children: [
                            TextSpan(
                                text: 'отсутствуют.',
                                style: GoogleFonts.inter(
                                  foreground: Paint()..shader = shader,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                )),
                          ])),
                ]),
    );
  }
}
