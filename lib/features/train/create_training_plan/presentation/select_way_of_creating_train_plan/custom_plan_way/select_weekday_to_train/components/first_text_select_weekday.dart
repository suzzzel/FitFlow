import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstTextSelectWeekday extends StatelessWidget {
  const FirstTextSelectWeekday({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 44),
      child: Center(
          child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: Text(
          'Выберите дни тренировок*',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      )),
    );
  }
}
