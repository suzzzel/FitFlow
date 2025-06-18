import 'dart:io';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/confirm_plan_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/edit_this_day_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/exercises_row_func.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadyPlanExercisesNotChangedPlan extends ConsumerWidget {
  const ReadyPlanExercisesNotChangedPlan(
      {super.key,
      required this.listOfDaysReadyPlan,
      required this.buttonAddedPlanState,
      required this.dir,
      required this.exercises});

  final List<ReadyTrainingPlanModel>? listOfDaysReadyPlan;
  final AsyncValue<void> buttonAddedPlanState;
  final AsyncValue<Directory> dir;
  final List<ExerciseModel> exercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          left: 33, right: 33, top: MediaQuery.of(context).size.height * 0.125),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 61),
        itemCount: listOfDaysReadyPlan!.length + 1,
        itemBuilder: (context, index) {
          // Кнопка сохранения плана после ListView
          if (index == listOfDaysReadyPlan!.length) {
            return ButtonConfirmPlan(
                buttonAddedPlanState: buttonAddedPlanState);
          } else {
            // конкретный день в тренировочном плане
            final thisDay = listOfDaysReadyPlan![index];
            return Column(
              children: [
                RuWeekdayTrainPlan(
                  weekday: listOfDaysReadyPlan![index].weekday,
                ),
                Container(
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Center(
                        child: _buildDayExercises(
                          thisDay: thisDay,
                          exercises: exercises,
                          dir: dir.value!,
                          context: context,
                        ),
                      ),
                    )),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _buildDayExercises({
  required ReadyTrainingPlanModel thisDay,
  required List<ExerciseModel> exercises,
  required Directory dir,
  required BuildContext context,
}) {
  final dayExercises = [
    thisDay.exOne,
    thisDay.exTwo,
    thisDay.exThree,
    thisDay.exFour,
    thisDay.exFive
  ];
  return Padding(
    padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        exercisesRow(
            dayExercises: dayExercises.sublist(0, 3),
            exercises: exercises,
            dir: dir,
            firstLine: true,
            context: context),
        exercisesRow(
            dayExercises: dayExercises.sublist(3),
            exercises: exercises,
            firstLine: false,
            dir: dir,
            context: context),
        EditThisDayButton(
          isThisViewReadyOrCustomPlan: true,
          weekday: thisDay.weekday,
          dir: dir,
        )
      ],
    ),
  );
}
