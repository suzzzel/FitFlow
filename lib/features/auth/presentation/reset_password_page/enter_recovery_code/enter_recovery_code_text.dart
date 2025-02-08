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
            child: Text(
          'Если к этому адресу электронной почты\nпривязана учетная запись,\nмы отправили на него 6-значный код\nдля подтверждения.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        )));
  }
}
