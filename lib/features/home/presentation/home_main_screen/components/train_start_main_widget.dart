import 'dart:developer';

import 'package:fitflow/features/train/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrainStartMainWidget extends ConsumerStatefulWidget {
  final String id;
  final List<TrainingPlanClass>? trainingPlan;
  final bool isPlanLoading;
  const TrainStartMainWidget(
      {super.key,
      required this.id,
      required this.trainingPlan,
      required this.isPlanLoading});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TrainStartMainWidgetState();
}

class _TrainStartMainWidgetState extends ConsumerState<TrainStartMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: widget.isPlanLoading
          ? const SizedBox(
              width: 30,
              height: 30,
              child: FittedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ))
          : SizedBox(
              child: Text(widget.trainingPlan!.isNotEmpty
                  ? widget.trainingPlan!.first.toString()
                  : 'Составить тренировку '),
            ),
    );
  }
}
