import 'dart:math';

import 'package:fitflow/features/train/create_training_plan/domain/providers/get_ready_training_plan_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_way_of_creating_train_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfrimWayOfCreatingButton extends ConsumerWidget {
  const ConfrimWayOfCreatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wayController = ref.watch(selectWayOfCreatingTrainPlanProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 44,
        right: 43,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: wayController != 0
                ? LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ], transform: const GradientRotation(pi / 4))
                : LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondaryFixedDim,
                    Theme.of(context).colorScheme.primaryFixedDim,
                  ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: wayController == 0
                ? null
                : () {
                    context.goNamed('readytrainplan');
                    ref.invalidate(getReadyTrainPlanDomainProvider);
                  },
            style: ButtonStyle(
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
    );
  }
}
