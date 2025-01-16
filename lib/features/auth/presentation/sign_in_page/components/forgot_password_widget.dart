import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 54),
        child: TextButton(
            style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
            onPressed: () {},
            child: FittedBox(
              child: Text(
                'Забыли пароль?',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.8)),
              ),
            )),
      ),
    );
  }
}
