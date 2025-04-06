import 'package:fitflow/features/train/get_today_train_info/presentation/train_day_train_today_info/components/train_today_icon.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/train_day_train_today_info/components/train_today_text.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';

class TrainDayInfoTrainToday extends StatelessWidget {
  final TrainingPlanClass train;
  final int numberOfWeek;
  final int numberOfDayTrain;
  final int countTrainInWeek;
  const TrainDayInfoTrainToday(
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
              const TrainTodayIconInsideTodayInfo(),
              const SizedBox(
                width: 21,
              ),
              TrainTodayTextInsideTodayInfo(
                  numberOfWeek: numberOfWeek,
                  train: train,
                  numberOfDayTrain: numberOfDayTrain,
                  countTrainInWeek: countTrainInWeek)
            ],
          ),
        ),
      ],
    );
  }
}
