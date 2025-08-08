import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAboutDeleteTrainPlan extends StatelessWidget {
  const InfoAboutDeleteTrainPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        textAlign: TextAlign.center,
        'Действительно хотите удалить тренировочный план?\nДля продолжения тренировок, его нужно будет создать заново.\nПредыдущие тренировки не будут удалены.',
        style: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
