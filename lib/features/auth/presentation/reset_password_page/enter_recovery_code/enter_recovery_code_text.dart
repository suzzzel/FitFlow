import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterRecoveryCodeText extends StatelessWidget {
  const EnterRecoveryCodeText({super.key});

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
            'Если к этому адресу электронной почты\nпривязана учетная запись,\nмы отправили на него 6-значный код\nдля подтверждения.',
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
