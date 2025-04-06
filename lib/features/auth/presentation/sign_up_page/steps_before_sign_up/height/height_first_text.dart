import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightFirstText extends StatelessWidget {
  const HeightFirstText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.23,
          left: 23,
          right: 22,
          bottom: MediaQuery.of(context).size.height * 0.67),
      child: SizedBox(
          width: 348,
          height: 93,
          child: FittedBox(
              child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Рост',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                      TextSpan(
                          text:
                              ' - важный параметр для создания\nперсональной программы\nтренировок.',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary))
                    ])),
          ))),
    );
  }
}
