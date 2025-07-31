import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/presentation/goal/goal_selector.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/goal/next_step_after_goal_select_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/goal/goal_first_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectGoalMainWidget extends ConsumerWidget {
  const SelectGoalMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const GoalFirstText(),
        const GoalSelector(
          key: Key('goal_selector'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 122),
          child: Align(
            alignment: const Alignment(0, 0.06),
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ], transform: const GradientRotation(pi / 4))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 122),
          child: Align(
            alignment: const Alignment(0, 0.23),
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ], transform: const GradientRotation(pi / 4))),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NextStepAfterGoalSelectButton(
              key: Key('confirm_goal'),
            ),
          ),
        ),
      ],
    );
  }
}
