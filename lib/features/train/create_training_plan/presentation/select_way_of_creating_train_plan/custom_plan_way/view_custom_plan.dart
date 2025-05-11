import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/edit_this_day_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/exercises_row_func.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ViewCustomPlan extends ConsumerWidget {
  const ViewCustomPlan({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempTrainProv = ref.read(tempTrainPlanProvider);
    final weekdaysOrTrain = ref.read(selectWeekdayCustomPlanProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    return dir.when(
        data: (directory) {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(weekdaysOrTrain.length, (int indexWeekday) {
                  return Column(
                    children: [
                      RuWeekdayTrainPlan(
                          weekday: weekdaysOrTrain[indexWeekday]),
                      tempTrainProv.exercisesByWeekday[
                                  weekdaysOrTrain[indexWeekday]] ==
                              null
                          ? Column(
                              children: [
                                Text(
                                  'no ex',
                                  style: TextStyle(color: Colors.red),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      context.goNamed(
                                          'findnewexercisewheneditcustomplan',
                                          extra: {
                                            'dir': directory,
                                            'weekday':
                                                weekdaysOrTrain[indexWeekday]
                                          });
                                    },
                                    child: Text('add'))
                              ],
                            )
                          : Container(
                              child: _buildDayExercisesInCustomPlan(
                                  thisDay: tempTrainProv.exercisesByWeekday[
                                          weekdaysOrTrain[indexWeekday]]!
                                      .take(5)
                                      .map((exercise) => exercise.id.toString())
                                      .toList(),
                                  weekday: weekdaysOrTrain[indexWeekday],
                                  exercises: tempTrainProv.exercisesByWeekday[
                                      weekdaysOrTrain[indexWeekday]]!,
                                  dir: directory,
                                  context: context)),
                    ],
                  );
                }),
              ),
            ],
          );
        },
        error: (err, stack) => Text('Error: $err'),
        loading: () => const CircularProgressIndicator());
  }
}

Widget _buildDayExercisesInCustomPlan({
  required List<String?> thisDay,
  required String weekday,
  required List<ExerciseModel> exercises,
  required Directory dir,
  required BuildContext context,
}) {
  final thisDayList = List<String?>.generate(
      5, (index) => index < thisDay.length ? thisDay[index] : null);
  return Padding(
    padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        exercisesRow(
            dayExercises: thisDayList.sublist(0, 3),
            exercises: exercises,
            dir: dir,
            firstLine: true,
            context: context),
        exercisesRow(
            dayExercises: thisDayList.sublist(3),
            exercises: exercises,
            firstLine: false,
            dir: dir,
            context: context),
        EditThisDayButton(
          weekday: weekday,
          dir: dir,
          isThisViewReadyOrCustomPlan: false,
        )
      ],
    ),
  );
}
