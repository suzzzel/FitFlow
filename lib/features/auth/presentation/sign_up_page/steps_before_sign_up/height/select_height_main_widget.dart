import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/presentation/height/height_selector.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/height/next_step_after_height_select_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/height/height_first_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectHeightMainWidget extends ConsumerWidget {
  const SelectHeightMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const HeightFirstText(),
        const HeightSelector(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 127),
          child: Align(
            alignment: const Alignment(0, 0.06),
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.secondaryFixed,
                Theme.of(context).colorScheme.primaryFixed,
              ], transform: const GradientRotation(pi / 4))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 127),
          child: Align(
            alignment: const Alignment(0, 0.285),
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.secondaryFixed,
                Theme.of(context).colorScheme.primaryFixed,
              ], transform: const GradientRotation(pi / 4))),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NextStepAfterHeightSelectButton(),
          ),
        ),
      ],
    );
  }
}
