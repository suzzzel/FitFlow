import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/chill_day/chill_day_button.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/loading_home_train_today.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/empty_plan/create_train_plan.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/train_day/start_train_button.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';

class InfoAboutTodayButton extends StatelessWidget {
  const InfoAboutTodayButton({
    super.key,
    required this.isPlanLoading,
    required this.trainingPlan,
    required this.weekDayNow,
  });

  final bool isPlanLoading;
  final List<TrainingPlanClass>? trainingPlan;
  final String weekDayNow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.5,
                color: Theme.of(context).colorScheme.secondaryFixed),
            borderRadius: BorderRadius.circular(20)),
        child: isPlanLoading
            ? const LoadingHomeTrainToday()
            : trainingPlan!.isEmpty
                ? const CreateTrainPlanButton()
                : trainingPlan!.indexWhere(
                            (element) => element.dayOfWeek == weekDayNow) !=
                        -1
                    ? const StartTrainButton()
                    : const ChillDayButton(),
      ),
    );
  }
}
