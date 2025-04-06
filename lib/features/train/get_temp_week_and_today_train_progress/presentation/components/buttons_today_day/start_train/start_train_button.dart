import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/start_train/components/first_icon_start_train.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/start_train/components/second_icon_start_train.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/start_train/components/start_train_text.dart';
import 'package:flutter/material.dart';

class StartTrainButton extends StatelessWidget {
  const StartTrainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 8),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstIconStartTrainInsideButton(),
            StartTrainTextIndiseButton(),
            SecondIconStartTrainInsideButton(),
          ],
        ));
  }
}
