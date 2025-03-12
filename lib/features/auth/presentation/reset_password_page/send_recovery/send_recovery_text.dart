import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendRecoveryText extends StatelessWidget {
  const SendRecoveryText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 331,
        height: 66,
        child: FittedBox(
            child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: Text(
            'Введите свою электронную почту, чтобы\nмы могли отправить вам 6-значный\nкод для подтверждения.',
            textScaler: const TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        )));
  }
}
