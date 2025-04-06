import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalFirstText extends StatelessWidget {
  const GoalFirstText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.23,
          left: 54,
          right: 50,
          bottom: MediaQuery.of(context).size.height * 0.67),
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: SizedBox(
            width: 289,
            height: 75,
            child: FittedBox(
              child: Text(
                'Выберите качества, которые хотите\nвзрастить в себе',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
            )),
      ),
    );
  }
}
