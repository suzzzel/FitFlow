import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void sucessDeleteTrainButtonSnackBar(BuildContext context) {
  return showTopSnackBar(
      Overlay.of(context),
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.errorContainer,
              Theme.of(context).colorScheme.error,
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Text(
              'Тренировочный план успешно удален',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ));
}
