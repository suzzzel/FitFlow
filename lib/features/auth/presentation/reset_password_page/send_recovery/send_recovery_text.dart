import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendRecoveryText extends StatelessWidget {
  const SendRecoveryText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 311,
        height: 66,
        child: FittedBox(
            child: Text(
          'Введите свою электронную почту, чтобы\nмы могли отправить вам 6-значный\nкод для подтверждения.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )));
  }
}
