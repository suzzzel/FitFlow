import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PercentOfDoneInResult extends StatelessWidget {
  const PercentOfDoneInResult({
    super.key,
    required this.percentOfDone,
  });

  final int percentOfDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 31),
      child: Container(
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.1)
            ])),
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: Text(
            textAlign: TextAlign.center,
            'Процент выполнения\nтренировки: $percentOfDone%',
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}
