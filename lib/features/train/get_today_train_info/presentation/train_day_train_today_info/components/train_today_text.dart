import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainTodayTextInsideTodayInfo extends StatelessWidget {
  const TrainTodayTextInsideTodayInfo({
    super.key,
    required this.numberOfWeek,
    required this.train,
    required this.numberOfDayTrain,
    required this.countTrainInWeek,
  });

  final int numberOfWeek;
  final TrainingPlanClass train;
  final int numberOfDayTrain;
  final int countTrainInWeek;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: Text(
            '$numberOfWeek-ая неделя',
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
            child: Text(train.mainMuscle ?? 'Fullbody',
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w700))),
        ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
            child: Text('Тренировка $numberOfDayTrain из $countTrainInWeek',
                style: GoogleFonts.inter(
                    fontSize: 12, fontWeight: FontWeight.w500))),
      ],
    );
  }
}
