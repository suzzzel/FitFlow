import 'dart:math';

import 'package:fitflow/features/train/create_training_plan/domain/controllers/confrim_ready_plan_controller.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonConfirmPlan extends ConsumerWidget {
  const ButtonConfirmPlan({
    super.key,
    required this.buttonAddedPlanState,
  });

  final AsyncValue<void> buttonAddedPlanState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 32, bottom: 54),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: () async {
              final tempTrainPlan = ref.read(tempTrainPlanProvider);
              final addedPlan = await ref
                  .read(confrimReadyPlanControllerProvider.notifier)
                  .confirmReadyPlan(days: tempTrainPlan.exercisesByWeekday);
              if (addedPlan) {
                // ignore: use_build_context_synchronously
                context.goNamed('/home');
              }
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: !buttonAddedPlanState.isLoading
                ? FittedBox(
                    child: Text(
                      'Продолжить',
                      textScaler: const TextScaler.linear(1),
                      style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                : const CircularProgressIndicator()),
      ),
    );
  }
}
