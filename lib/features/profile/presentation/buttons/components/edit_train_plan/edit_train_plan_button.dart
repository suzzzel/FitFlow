import 'dart:math';

import 'package:fitflow/features/profile/domain/providers/home_buttons_domain_provider.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/empty_train_plan_snackbar.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/error_delete_train_plan_snackbar.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTrainPlanButton extends ConsumerWidget {
  const EditTrainPlanButton({super.key, required this.offlineMode});

  final bool offlineMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 39, right: 39, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
          onPressed: () async {
            if (offlineMode) {
              errorDeleteTrainButtonSnackBar(context);
            } else {
              final homeButtonRepo = ref.read(homeButtonsDomainProvider);
              final tempPlan = await homeButtonRepo.getTempPlanToEdit();
              if (tempPlan.isEmpty) {
                // ignore: use_build_context_synchronously
                emptyTrainPlanSnackBar(context: context);
              } else {
                ref
                    .read(tempTrainPlanProvider.notifier)
                    .loadExistPlan(existPlan: tempPlan);
                ref
                    .read(selectWeekdayCustomPlanProvider.notifier)
                    .loadExistWeekDay(weekdays: tempPlan.keys.toList());
                // ignore: use_build_context_synchronously
                context.goNamed('selectweekdaytoeditsavedplan');
              }
            }
          },
          style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor:
                  const WidgetStatePropertyAll(Colors.transparent)),
          child: Text(
            'Изменить тренировочный план',
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
