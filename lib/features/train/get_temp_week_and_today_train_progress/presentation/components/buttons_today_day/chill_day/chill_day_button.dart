import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/chill_day/components/chill_day_icon.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/chill_day/components/chill_day_text.dart';
import 'package:flutter/material.dart';

class ChillDayButton extends StatelessWidget {
  const ChillDayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        padding: const EdgeInsets.only(left: 7, right: 15),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.tertiaryContainer,
              Theme.of(context).colorScheme.tertiary,
            ])),
        child: const Row(
          children: [
            ChillDayIconInsideButton(),
            ChillDayTextInsideButton(),
          ],
        ));
  }
}
