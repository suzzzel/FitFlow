import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PercentOfCompleteInProgressDay extends StatelessWidget {
  const PercentOfCompleteInProgressDay({
    super.key,
    required this.percent,
  });

  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 201,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.8),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.8)
              ])),
      child: FittedBox(
        child: Text(
          'Процент выполнения\n$percent %',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
