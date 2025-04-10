import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalTextReadyPlan extends StatelessWidget {
  const GoalTextReadyPlan({super.key, required this.goal});

  final String goal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: Text(
          'Развивает: ${_getGoalRU(goal: goal)}',
          textAlign: TextAlign.center,
          textScaler: const TextScaler.linear(1),
          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

String _getGoalRU({required String goal}) {
  switch (goal) {
    case 'strength':
      return 'Сила';
    case 'flexibility':
      return 'Гибкость';
    case 'endurance':
      return 'Выносливость';
    default:
      return '';
  }
}
