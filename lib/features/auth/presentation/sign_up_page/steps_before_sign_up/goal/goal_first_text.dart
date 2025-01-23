import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalFirstText extends StatelessWidget {
  const GoalFirstText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.23,
          left: 23,
          right: 22,
          bottom: MediaQuery.of(context).size.height * 0.67),
      child: SizedBox(
          width: 348,
          height: 93,
          child: FittedBox(
            child: Text(
              'Зная вашу цель, мы сможем предложить вам\nпрограммы тренировок, которые идеально подходят\nвашему уровню подготовки и помогут достичь\nрезультата без лишних усилий.',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          )),
    );
  }
}
