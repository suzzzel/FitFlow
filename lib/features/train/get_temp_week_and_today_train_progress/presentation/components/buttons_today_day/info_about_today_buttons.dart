import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/chill_day/chill_day_button.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/loading_home_train_today.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/empty_plan/create_train_plan_button.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/start_train/start_train_button.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/view_progress/view_progress_button.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoAboutTodayButton extends StatelessWidget {
  const InfoAboutTodayButton(
      {super.key,
      required this.isPlanLoading,
      required this.trainingPlan,
      required this.weekDayNow,
      required this.todayTrain});

  final bool isPlanLoading;
  final List<TrainingPlanClass>? trainingPlan;
  final String weekDayNow;
  final AsyncValue<TrainingDayClass?> todayTrain;

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
            // У юзера есть тренировочный план?
            : trainingPlan!.isEmpty
                // Тренировочного плана нет
                ? const CreateTrainPlanButton()
                // Тренировочный план есть, сегодня день отдыха?
                : trainingPlan!.indexWhere(
                            (element) => element.dayOfWeek == weekDayNow) !=
                        -1
                    // Сегодня день тренировки, она была?
                    ? todayTrain.value == null
                        // Тренировки не было, можно начать
                        ? const StartTrainButton()
                        // Тренировка была, можно отследить прогресс
                        : const ViewProgressButton()
                    // Сегодня день отдыха
                    : const ChillDayButton(),
      ),
    );
  }
}
