import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ScaffoldFeatureController showNetworkErrorSignUp(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      height: 30,
      margin: const EdgeInsets.all(5),
      child: FittedBox(
        child: Text(
          'Не удалось авторизоваться.\nПроверьте подключение к сети.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.secondary,
    duration: const Duration(milliseconds: 1500),
    width: MediaQuery.of(context).size.width * 0.8,
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22.0),
    ),
  ));
}
