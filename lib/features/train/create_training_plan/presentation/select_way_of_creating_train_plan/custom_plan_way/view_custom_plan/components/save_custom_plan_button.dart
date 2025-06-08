import 'dart:math';

import 'package:fitflow/features/train/create_training_plan/domain/controllers/confrim_ready_plan_controller.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/temp_train_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveCustomPlanButton extends ConsumerWidget {
  const SaveCustomPlanButton({
    super.key,
    required this.weekdaysOrTrain,
    required this.tempTrainProv,
  });

  final List<String> weekdaysOrTrain;
  final TempTrainPlanModel tempTrainProv;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 39, right: 39, bottom: 35),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(99)),
              gradient: LinearGradient(
                  colors: weekdaysOrTrain.length !=
                          tempTrainProv.exercisesByWeekday.length
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
              onPressed: weekdaysOrTrain.length ==
                      tempTrainProv.exercisesByWeekday.length
                  ? () async {
                      final addedPlan = await ref
                          .read(confrimReadyPlanControllerProvider.notifier)
                          .confirmReadyPlan(
                              days: tempTrainProv.exercisesByWeekday);
                      if (addedPlan) {
                        // ignore: use_build_context_synchronously
                        context.goNamed('/home');
                      }
                    }
                  : () {},
              style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 60)),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent)),
              child: FittedBox(
                child: Text(
                  'Сохранить план',
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
