import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CloseDetailViewExerciseInSearch extends StatelessWidget {
  const CloseDetailViewExerciseInSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(99)),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.secondaryFixed,
            Theme.of(context).colorScheme.primaryFixed,
          ], transform: const GradientRotation(pi / 2))),
      child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
          child: FittedBox(
            child: Text(
              'Закрыть',
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
