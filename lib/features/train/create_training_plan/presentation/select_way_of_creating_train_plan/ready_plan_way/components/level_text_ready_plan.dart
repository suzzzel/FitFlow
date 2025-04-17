import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelTextReadyPlan extends StatelessWidget {
  const LevelTextReadyPlan({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Сложность: ${_getDifficultRU(tempDiff: level)}',
            textAlign: TextAlign.center,
            textScaler: const TextScaler.linear(1),
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

String _getDifficultRU({required String tempDiff}) {
  switch (tempDiff) {
    case 'skilled':
      return 'Умеренная';
    case 'master':
      return 'Хард';
    case 'beginner':
      return 'Легкая';
    default:
      return '';
  }
}
