import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/get_ready_training_plan_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/ready_plan_way/components/goal_text_ready_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/ready_plan_way/components/level_text_ready_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/ready_plan_way/components/name_text_ready_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/ready_plan_way/components/training_ready_plan_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SelectReadyPlanMainWidget extends ConsumerWidget {
  const SelectReadyPlanMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<int, List<ReadyTrainingPlanModel>>> readyPlans =
        ref.watch(getReadyTrainPlanDomainProvider);
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
                                width: double.maxFinite,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      NameReadyPlan(
                                          name: readyPlans[trueIndex]!
                                              .first
                                              .name),
                                      TrainingReadyPlanDays(
                                          lengthWeekDays:
                                              readyPlans[trueIndex]!.length,
                                          trainDays: readyPlans[trueIndex]!),
                                      LevelTextReadyPlan(
                                        level:
                                            readyPlans[trueIndex]!.first.level,
                                      ),
                                      GoalTextReadyPlan(
                                          goal: readyPlans[trueIndex]!
                                              .first
                                              .goal),
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
