import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseName extends StatelessWidget {
  const ExerciseName({
    super.key,
    required this.exName,
  });

  final String exName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: Text(
          textAlign: TextAlign.center,
          exName,
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.clip,
          style: GoogleFonts.inter(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }
}
