import 'dart:developer';

import 'package:fitflow/features/train/get_training_plan/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        padding: const EdgeInsets.only(top: 13),
        child: isPlanLoading
            ? const SizedBox(
                width: 30,
                height: 30,
                child: FittedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ))
            : trainingPlan!.isEmpty
                ? ElevatedButton(
                    onPressed: () {
                      context.goNamed('newtrainplan');
                    },
                    child: const Text('create button'))
                : SizedBox(
                    child: trainingPlan!.indexWhere(
                                (element) => element.dayOfWeek == weekDayNow) !=
                            -1
                        ? Text(
                            'Сегодня тренировка ${trainingPlan![trainingPlan!.indexWhere((element) => element.dayOfWeek == weekDayNow)].mainMuscle ?? 'смешанная'}')
                        : const Text('chill day'),
                  ));
  }
}
