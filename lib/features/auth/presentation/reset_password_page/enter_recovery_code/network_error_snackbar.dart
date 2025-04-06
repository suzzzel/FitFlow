import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ScaffoldFeatureController showNetworkError(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Material(
      color: Colors.transparent,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.errorContainer,
              Theme.of(context).colorScheme.error,
            ], transform: const GradientRotation(pi / 4))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FittedBox(
            child: Text(
              'Отсутствует подключение к сети',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    duration: const Duration(milliseconds: 1500),
    width: MediaQuery.of(context).size.width * 0.83,
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(99.0),
    ),
  ));
}
