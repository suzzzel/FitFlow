import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTextSelectWeekday extends StatelessWidget {
  const SecondTextSelectWeekday({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 76),
      child: Center(
          child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: SizedBox(
          height: 100,
          child: Text(
            textAlign: TextAlign.center,
            '*рекомендуем не более\n6 дней в неделю',
            style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
      )),
    );
  }
}
