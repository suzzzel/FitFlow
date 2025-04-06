import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChillDayInfo extends StatelessWidget {
  final int numberOfWeek;
  const ChillDayInfo({super.key, required this.numberOfWeek});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 24, bottom: 31),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: FittedBox(
                    child: Image.asset('assets/home/training_lightning.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 23,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                    child: Text(
                      '$numberOfWeek-ая неделя',
                      style: GoogleFonts.inter(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) => LinearGradient(colors: [
                            Theme.of(context).colorScheme.primaryFixed,
                            Theme.of(context).colorScheme.secondaryFixed,
                          ]).createShader(bounds),
                      child: SizedBox(
                        height: 36,
                        child: FittedBox(
                          child: Text('Вам необходимо\nвосстановиться!',
                              style: GoogleFonts.inter(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
