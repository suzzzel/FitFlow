import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightSecondText extends StatelessWidget {
  const WeightSecondText({
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
              'Указание вашего веса поможет нам рассчитать\nваши индивидуальные потребности в калориях и\nадаптировать тренировочные планы для\nдостижения ваших целей.',
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
