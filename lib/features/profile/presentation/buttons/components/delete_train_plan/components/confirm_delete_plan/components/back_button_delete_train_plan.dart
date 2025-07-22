import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BackButtonDeleteTrainPlan extends StatelessWidget {
  const BackButtonDeleteTrainPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(99)),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixedDim,
            Theme.of(context).colorScheme.secondaryFixedDim,
          ], transform: const GradientRotation(pi / 2))),
      child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width * 0.35, 35)),
              backgroundColor:
                  const WidgetStatePropertyAll(Colors.transparent)),
          child: Text('Назад',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondary))),
    );
  }
}
