// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthSelectButton extends StatelessWidget {
  final String text;
  final bool isLogin;
  final Function()? onPressed;
  const AuthSelectButton({
    super.key,
    required this.text,
    required this.isLogin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color signInColorBackground = Theme.of(context).colorScheme.secondary;
    final Color signInColorText = Theme.of(context).colorScheme.onSecondary;
    final Color signUpColorBackground = Theme.of(context).colorScheme.surface;
    final Color signUpColorText = Theme.of(context).colorScheme.onTertiary;
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 22),
      child: SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  isLogin ? signInColorBackground : signUpColorBackground),
            ),
            child: FittedBox(
              child: Text(
                text,
                style: GoogleFonts.inter(
                    color: isLogin ? signInColorText : signUpColorText,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }
}
