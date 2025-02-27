import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightHomeFirstText extends StatelessWidget {
  const WeightHomeFirstText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.23,
        left: 23,
        right: 22,
      ),
      child: SizedBox(
          width: 348,
          height: 93,
          child: FittedBox(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          'Изменился вес?\nПоменяйте его в приложении\nи отслеживайте\n',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary),
                      children: [
                        TextSpan(
                            text: ' изменения.',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onPrimary))
                      ])))),
    );
  }
}
