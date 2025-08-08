import 'package:fitflow/features/progress/domain/models/progress_in_day_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountOfCompetedExerciseInDay extends StatelessWidget {
  const CountOfCompetedExerciseInDay({
    super.key,
    required this.resultInDay,
  });

  final ProgressInDayModel resultInDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.8),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.8)
              ])),
      height: 37,
      width: 201,
      child: FittedBox(
        child: Text(
          'Кол-во выполненных\nупражнений - ${resultInDay.countOfExerciseInDay()}',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
