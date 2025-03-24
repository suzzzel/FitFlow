import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainDayInfoTrainExist extends StatelessWidget {
  final TrainingPlanClass train;
  final int numberOfWeek;
  final int numberOfDayTrain;
  final int countTrainInWeek;
  const TrainDayInfoTrainExist(
      {super.key,
      required this.train,
      required this.numberOfWeek,
      required this.numberOfDayTrain,
      required this.countTrainInWeek});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: FittedBox(
                    child: Image.asset('assets/home/training_lightning.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 21,
              ),
              Column(
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
                      style: GoogleFonts.inter(
                          fontSize: 15, fontWeight: FontWeight.w500),
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
                      child: Text(
                          'Тренировка $numberOfDayTrain из $countTrainInWeek',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w500))),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
