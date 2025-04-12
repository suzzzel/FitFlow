import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/create_training_plan_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/ready_plan_way/components/goal_text_ready_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/ready_plan_way/components/image_ready_plan_.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/ready_plan_way/components/level_text_ready_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/ready_plan_way/components/name_text_ready_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/ready_plan_way/components/training_ready_plan_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SelectReadyPlanMainWidget extends ConsumerWidget {
  const SelectReadyPlanMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<int, List<ReadyTrainingPlanModel>>> readyPlans =
        ref.watch(createTrainPlanDomainProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    return Stack(alignment: Alignment.center, children: [
      readyPlans.when(
          data: (readyPlans) {
            if (dir.isLoading) {
              return const CircularProgressIndicator();
            } else {
              log(readyPlans.toString());
              return Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.125),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 61),
                  itemCount: readyPlans.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    final exFolderPath = '${dir.value!.path}/exGifs';
                    final trueIndex = index + 1;
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 33, right: 33, bottom: 22),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {
                              context.goNamed('viewselectedplan', extra: {
                                'isThisReadyPlanOrCustom': true,
                                'listOfTrainDays': readyPlans[trueIndex]
                              });
                            },
                            child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Theme.of(context)
                                              .colorScheme
                                              .primaryFixed
                                              .withOpacity(0.1),
                                          Theme.of(context)
                                              .colorScheme
                                              .secondaryFixed
                                              .withOpacity(0.1),
                                        ])),
                                height: 146,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19, top: 15, right: 10),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            const ImageReadyPlan(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 7,
                                              ),
                                              child: Column(
                                                children: [
                                                  NameReadyPlan(
                                                      name:
                                                          readyPlans[trueIndex]!
                                                              .first
                                                              .name),
                                                  TrainingReadyPlanDays(
                                                      lengthWeekDays:
                                                          readyPlans[trueIndex]!
                                                              .length,
                                                      trainDays: readyPlans[
                                                          trueIndex]!),
                                                  LevelTextReadyPlan(
                                                    level: readyPlans[
                                                            trueIndex]![index]
                                                        .level,
                                                  ),
                                                  GoalTextReadyPlan(
                                                      goal: readyPlans[
                                                              trueIndex]![index]
                                                          .goal),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator()),
    ]);
  }
}
