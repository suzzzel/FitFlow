import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightFirstText extends StatelessWidget {
  const WeightFirstText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.23,
        left: 23,
        right: 22,
      ),
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
                  child: Text(
                    'Вес - важный параметр для создания\nперсональной программы',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )))),
    );
  }
}
