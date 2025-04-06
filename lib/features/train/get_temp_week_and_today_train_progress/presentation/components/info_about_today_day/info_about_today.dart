import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/info_about_today_day/components/graph_icon.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/info_about_today_day/components/has_activity_circle.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/info_about_today_day/components/no_activity_today_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoAboutToday extends ConsumerWidget {
  const InfoAboutToday(
      {super.key,
      required this.date,
      required this.isActivityTodayExist,
      required this.todayTrain,
      this.percentActivity});

  final String date;
  final bool isActivityTodayExist;
  final int? percentActivity;
  final AsyncValue<TrainingDayClass?> todayTrain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 118,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5,
                    color: Theme.of(context).colorScheme.secondaryFixed),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: todayTrain.isLoading
                      ? const CircularProgressIndicator(
                          strokeWidth: 2,
                        )
                      // Если true - то план есть, и есть активность сегодня (в т.ч. должна быть согласно плану)
                      : isActivityTodayExist
                          // Сегодня была тренировка?
                          ? todayTrain.value != null
                              // Была - процент выполнения
                              ? HasActivityCircle(todayTrain: todayTrain)
                              // Должна быть, но пока её нет
                              : const NoActivityTodayText()
                          :
                          // НЕТ плана тренировки ИЛИ день отдыха
                          const NoActivityTodayText()),
            ),
          ),
        ),
        GraphIcon(date: date)
      ],
    );
  }
}
