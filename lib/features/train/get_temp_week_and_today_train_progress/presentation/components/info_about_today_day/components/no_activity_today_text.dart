import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoActivityTodayText extends StatelessWidget {
  const NoActivityTodayText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 107,
      child: FittedBox(
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.secondaryFixed,
            Theme.of(context).colorScheme.primaryFixed,
          ]).createShader(bounds),
          child: Text(
            'Пока нет активности',
            style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
