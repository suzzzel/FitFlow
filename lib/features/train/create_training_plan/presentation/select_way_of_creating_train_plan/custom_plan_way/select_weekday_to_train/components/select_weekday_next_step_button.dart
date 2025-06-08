import 'dart:math';

import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectWeekdayNextStepButton extends ConsumerWidget {
  const SelectWeekdayNextStepButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDaySelectProvider = ref.watch(selectWeekdayCustomPlanProvider);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 39, right: 39, bottom: 35),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(99)),
              gradient: LinearGradient(
                  colors: weekDaySelectProvider.length >= 7 ||
                          weekDaySelectProvider.isEmpty
                      ? [
                          Theme.of(context).colorScheme.primaryFixedDim,
                          Theme.of(context).colorScheme.secondaryFixedDim,
                        ]
                      : [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.primary,
                        ],
                  transform: const GradientRotation(pi / 2))),
          child: ElevatedButton(
              onPressed: weekDaySelectProvider.length >= 7 ||
                      weekDaySelectProvider.isEmpty
                  ? () {}
                  : () {
                      context.goNamed('viewcustomplan');
                    },
              style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 60)),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent)),
              child: FittedBox(
                child: Text(
                  'Продолжить',
                  style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              )),
        ),
      ),
    );
  }
}
