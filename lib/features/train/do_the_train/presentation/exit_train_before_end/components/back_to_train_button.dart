import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BackToTrainButton extends StatelessWidget {
  const BackToTrainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ], transform: const GradientRotation(pi / 2))),
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            onPressed: () {
              context.pop();
            },
            child: Text('Вернуться',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondary))),
      ),
    );
  }
}
