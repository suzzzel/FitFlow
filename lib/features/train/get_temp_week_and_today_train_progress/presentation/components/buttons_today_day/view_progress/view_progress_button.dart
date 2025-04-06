import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/view_progress/components/view_progress_icon.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/components/buttons_today_day/view_progress/components/view_progress_text.dart';
import 'package:flutter/material.dart';

class ViewProgressButton extends StatelessWidget {
  const ViewProgressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        padding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
        ),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ])),
        child: const Padding(
          padding: EdgeInsets.only(left: 24, right: 23, top: 9, bottom: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ViewProgressTextInsideButton(),
              ViewProgressIconInsideButton(),
            ],
          ),
        ));
  }
}
