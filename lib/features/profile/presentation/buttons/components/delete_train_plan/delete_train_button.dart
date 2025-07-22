// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/confirm_delete_plan/confirm_delete_train_plan_snackbar_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteTrainPlanButton extends ConsumerWidget {
  const DeleteTrainPlanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 39, right: 39, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.errorContainer.withOpacity(0.8),
                  Theme.of(context)
                      .colorScheme
                      .tertiaryFixedDim
                      .withOpacity(0.8),
                ],
                transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
          onPressed: () {
            confirmDeletePlan(context);
          },
          style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor:
                  const WidgetStatePropertyAll(Colors.transparent)),
          child: Text(
            'Удалить тренировочный план',
            textScaler: const TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
