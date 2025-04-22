import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartTrainTextIndiseButton extends StatelessWidget {
  const StartTrainTextIndiseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: const ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
      child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ]).createShader(bounds),
          child: Text('Начать\nтренировку',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 15, fontWeight: FontWeight.w700))),
    );
  }
}
