import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeTrain extends StatelessWidget {
  const WelcomeTrain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 212, top: 31),
      child: FittedBox(
        child: Text(
          'Моя тренировка',
          style: GoogleFonts.inter(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
