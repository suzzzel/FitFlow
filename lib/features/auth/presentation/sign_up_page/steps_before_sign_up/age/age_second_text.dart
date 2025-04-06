import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeSecondText extends StatelessWidget {
  const AgeSecondText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.24,
            left: 11,
            right: 11),
        child: SizedBox(
          width: 335,
          height: 39,
          child: FittedBox(
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) => LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ]).createShader(bounds),
              child: Text(
                'Указывайте честно, ваши данные не\nвидим даже мы :)',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
