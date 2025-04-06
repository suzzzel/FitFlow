import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HasActivityCircle extends StatelessWidget {
  const HasActivityCircle({
    super.key,
    required this.todayTrain,
  });

  final AsyncValue<TrainingDayClass?> todayTrain;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 66,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.3),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.3)
              ])),
      child: Text(
        '${todayTrain.value!.percentOfTrainDone}%',
        style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
