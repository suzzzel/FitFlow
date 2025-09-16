import 'dart:math';

import 'package:fitflow/features/home/domain/providers/get_ex_train_plan_future.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/temp_train_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/view_custom_plan/components/save_custom_plan_button/controller/save_custom_plan_controller.dart';
import 'package:fitflow/features/train/do_the_train/data/providers/do_the_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_exercise_domain_future_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveCustomPlanButton extends ConsumerWidget {
  const SaveCustomPlanButton(
      {super.key,
      required this.weekdaysOrTrain,
      required this.tempTrainProv,
      this.isEditSavedPlan});

  final List<String> weekdaysOrTrain;
  final TempTrainPlanModel tempTrainProv;
  final bool? isEditSavedPlan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateSaveButton = ref.watch(saveCustomPlanControllerProvider);
    final saveButtonNotifier =
        ref.watch(saveCustomPlanControllerProvider.notifier);
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
              onPressed: isEditSavedPlan == true &&
                      weekdaysOrTrain.length ==
                          tempTrainProv.exercisesByWeekday.length &&
                      !stateSaveButton.isLoading
                  ?
                  // обновление существующего плана
                  () async {
                      final changedPlan =
                          await saveButtonNotifier.updateExistPlan(
                              exerciseByWeekday:
                                  tempTrainProv.exercisesByWeekday);
                      if (changedPlan) {
                        ref.invalidate(getExInfoTrainingPlanProvider);
                        ref.invalidate(tempTrainStateNotifierProvider);
                        ref.invalidate(doTheTrainDataProvider);
                        ref.invalidate(tempExerciseFutureProvider);

                        // ignore: use_build_context_synchronously
                        context.goNamed('/home');
                      }
                    }
                  : weekdaysOrTrain.length ==
                              tempTrainProv.exercisesByWeekday.length &&
                          !stateSaveButton.isLoading
                      ?
                      // создание нового кастомного плана
                      () async {
                          final addedPlan =
                              await saveButtonNotifier.saveCustomPlan(
                                  exerciseByWeekday:
                                      tempTrainProv.exercisesByWeekday);
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
              child: !stateSaveButton.isLoading
                  ? FittedBox(
                      child: Text(
                        'Сохранить план',
                        textScaler: const TextScaler.linear(1),
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    )),
        ),
      ),
    );
  }
}
