import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeSecondText extends StatelessWidget {
  const AgeSecondText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.24,
            left: 11,
            right: 11),
        child: SizedBox(
          width: 371,
          height: 80,
          child: FittedBox(
            child: Text(
              'Указание возраста поможет нам адаптировать\nтренировочные планы, рекомендации по\nпитанию и отслеживание прогресса под ваши\nфизиологические особенности.',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
