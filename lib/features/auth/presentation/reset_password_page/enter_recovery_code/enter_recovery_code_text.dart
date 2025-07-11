import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterRecoveryCodeText extends StatelessWidget {
  final String recoveryTextFromRoute;
  const EnterRecoveryCodeText({super.key, required this.recoveryTextFromRoute});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 292,
        height: 87,
        child: FittedBox(
            child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: Text(
            recoveryTextFromRoute,
            textScaler: const TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        )));
  }
}
