import 'dart:developer';

import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/home/presentation/components/view_train_plan.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/week_progress_today_train_main_widget.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/train_info_main_widget.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/welcome_train.dart';
import 'package:fitflow/features/train/get_training_plan/domain/providers/get_training_plan_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

class HomeMainWidget extends ConsumerWidget {
  const HomeMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    final trainingPlan =
        ref.watch(getTrainingPlanDomainProviderAsyncProvider(id: user.id!));
    final timeNow = DateTime.now();
    final weekDayNow = DateFormat('EEEE').format(timeNow).toLowerCase();
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.125),
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          WelcomeTrain(
            isPlanExist:
                trainingPlan.hasValue == true && trainingPlan.value!.isNotEmpty,
            isTodayChillday: trainingPlan.value?.indexWhere(
                        (element) => element.dayOfWeek == weekDayNow) !=
                    -1
                ? false
                : true,
            todayDate:
                '${DateFormat.MMM().format(DateTime.now())}, ${DateTime.now().day}',
          ),
          TrainingPlanMainWidget(
            trainingPlan: trainingPlan.hasValue ? trainingPlan.value : [],
            isPlanLoading: trainingPlan.isLoading,
            weekDayNow: weekDayNow,
            timeNow: timeNow,
          ),
          WeekProgressTodayTrainMainWidget(
            trainingPlan: trainingPlan.hasValue ? trainingPlan.value : [],
            isPlanLoading: trainingPlan.isLoading,
            todayDate:
                '${DateFormat.MMM().format(DateTime.now())}, ${DateTime.now().day}',
          ),
          trainingPlan.when(
              data: (plan) {
                return plan.isEmpty ? SizedBox() : ViewTrainPlanInHomeWidget();
              },
              error: (e, st) => SizedBox(),
              loading: () => SizedBox()),
          const SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          // context.goNamed('/progresshome');
                          // ref
                          //     .read(localDatabaseProvider)
                          //     .managers
                          //     .trainingTable
                          //     .delete();
                          // ref
                          //     .read(localDatabaseProvider)
                          //     .managers
                          //     .trainingPlanTable
                          //     .delete();

                          final Map<String, List<ExerciseModel>> returnedPlan =
                              {};
                          log(returnedPlan.toString());
                          final offlinePlan = await ref
                              .read(localDatabaseProvider)
                              .managers
                              .trainingPlanTable
                              .get();
                          for (var dayOfWeek in offlinePlan) {
                            List<String> exerciseNeedToLoad = [];
                            final exerciseInTempDayOfWeek = [
                              dayOfWeek.exerciseOne,
                              dayOfWeek.exerciseTwo,
                              dayOfWeek.exerciseThree,
                              dayOfWeek.exerciseFour,
                              dayOfWeek.exerciseFive,
                            ];
                            for (var x in exerciseInTempDayOfWeek) {
                              if (x == null) {
                                continue;
                              } else {
                                exerciseNeedToLoad.add(x);
                              }
                            }
                            for (var exercise in exerciseNeedToLoad) {
                              final exerciseInfo = await ref
                                  .read(localDatabaseProvider)
                                  .managers
                                  .exerciseTable
                                  .filter(
                                      (f) => f.id.equals(int.parse(exercise)))
                                  .limit(1)
                                  .getSingle();
                              returnedPlan
                                  .putIfAbsent(dayOfWeek.dayOfWeek, () => [])
                                  .add(ExerciseModel.fromJson(
                                      exerciseInfo.toJson()));
                            }
                          }
                          log(returnedPlan.toString());
                          // ref.read(getMainProgressProvider);
                          // ref
                          //     .read(localDatabaseProvider)
                          //     .managers
                          //     .trainingTable
                          //     .create((f) => f(
                          //         dayOfTraining: '2025-05-22',
                          //         // типа сделал треню
                          //         exerciseOne: '2',
                          //         countRepsExOne: 5,
                          //         maxWeightExOne: '110',
                          //         percentOfTrainDone: 70,
                          //         idUser: user.id!));
                          // ref
                          //     .read(localDatabaseProvider)
                          //     .managers
                          //     .trainingTable
                          //     .create((f) => f(
                          //         dayOfTraining: '2025-03-23',
                          //         exerciseOne: '115',
                          //         countRepsExOne: 5,
                          //         maxWeightExOne: '110',
                          //         percentOfTrainDone: 65,
                          //         idUser: 'test'));
                          // ref
                          //     .read(localDatabaseProvider)
                          //     .managers
                          //     .trainingTable
                          //     .filter((f) => f.dayOfTraining('2025-03-19'))
                          //     .delete();
                        },
                        child: const Text('stage button :)')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
