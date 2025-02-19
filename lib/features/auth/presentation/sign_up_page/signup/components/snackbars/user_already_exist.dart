import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ScaffoldFeatureController showUserAlreadyExist(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      margin: const EdgeInsets.all(5),
      child: FittedBox(
        child: Text(
          'Пользователь уже существует.\nПопробуйте авторизоваться или ввести новые данные',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 5,
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
