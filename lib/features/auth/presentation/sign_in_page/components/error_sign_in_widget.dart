import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorSignInWidget extends StatelessWidget {
  final bool error;
  const ErrorSignInWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 23, right: 44, left: 44),
        child: FittedBox(
          child: Text(
            'Неверное имя пользователя или email',
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: error
                    ? const Color.fromRGBO(255, 10, 10, 0.8)
                    : Colors.transparent),
          ),
        ));
  }
}
