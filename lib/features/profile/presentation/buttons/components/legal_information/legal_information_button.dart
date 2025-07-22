import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final _gitUrl = Uri.parse('https://github.com/suzzzel/FitFlow');

class LegalInformationButton extends StatelessWidget {
  const LegalInformationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 39, right: 39, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixedDim.withOpacity(0.8),
              Theme.of(context).colorScheme.secondaryFixedDim.withOpacity(0.8),
            ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
          onPressed: () async {
            await launchUrl(_gitUrl);
          },
          style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor:
                  const WidgetStatePropertyAll(Colors.transparent)),
          child: Text(
            'Правовая информация',
            textScaler: const TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
