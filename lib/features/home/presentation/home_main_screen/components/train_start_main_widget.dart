import 'dart:developer';

import 'package:fitflow/features/train/get_training_plan/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TrainingPlanMainWidget extends StatelessWidget {
  final List<TrainingPlanClass>? trainingPlan;
  final bool isPlanLoading;
  const TrainingPlanMainWidget(
      {super.key, required this.isPlanLoading, required this.trainingPlan});

  @override
  Widget build(BuildContext context) {
    final timeNow = DateTime.now();
    final weekDayNow = DateFormat('EEEE').format(timeNow).toLowerCase();
    return Padding(
        padding: const EdgeInsets.only(top: 26, left: 37, right: 29),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryFixed.withOpacity(0.1),
                    Theme.of(context)
                        .colorScheme
                        .secondaryFixed
                        .withOpacity(0.1),
                  ])),
          height: 198,
          child: isPlanLoading
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                )
              : trainingPlan!.isEmpty
                  ? ElevatedButton(
                      onPressed: () {
                        context.goNamed('newtrainplan');
                      },
                      child: const Text('create button'))
                  : trainingPlan!.indexWhere(
                              (element) => element.dayOfWeek == weekDayNow) !=
                          -1
                      ? TrainDay(
                          train: trainingPlan![trainingPlan!.indexWhere(
                              (element) => element.dayOfWeek == weekDayNow)],
                          numberOfWeek: timeNow
                                          .difference(DateTime.parse(
                                              trainingPlan!
                                                  .first.dataCreatingPlan))
                                          .inDays /
                                      7 <=
                                  1
                              ? 1
                              : timeNow
                                          .difference(DateTime.parse(
                                              trainingPlan!
                                                  .first.dataCreatingPlan))
                                          .inDays ~/
                                      7 +
                                  1,
                          numberOfDayTrain: trainingPlan!.indexWhere(
                              (element) => element.dayOfWeek == weekDayNow),
                        )
                      : Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Text('chill day'),
                          ),
                        ),
        ));
  }
}

class TrainDay extends StatelessWidget {
  final TrainingPlanClass train;
  final int numberOfWeek;
  final int numberOfDayTrain;
  const TrainDay(
      {super.key,
      required this.train,
      required this.numberOfWeek,
      required this.numberOfDayTrain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: FittedBox(
                    child: Image.asset('assets/navbar/progress.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
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
                    Text('Тренировка $numberOfDayTrain из 5')
                  ],
                ),
              )
            ],
          ),
        ),
        Container(child: Row())
      ],
    );
  }
}

// Text(
//                           'Сегодня тренировка ${trainingPlan![trainingPlan!.indexWhere((element) => element.dayOfWeek == weekDayNow)].mainMuscle ?? 'Fullbody'}')
