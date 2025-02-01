import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelFirstText extends StatelessWidget {
  const LevelFirstText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 315,
        height: 93,
        child: FittedBox(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Правильно подобранный уровень\nобеспечивает',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        height: 1.7,
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                      TextSpan(
                          text: ' оптимальную нагрузку',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.onPrimary)),
                      TextSpan(
                          text:
                              ', которая\nспособствует прогрессу без риска травм и\nперетренированности.',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.onPrimary))
                    ]))));
  }
}
