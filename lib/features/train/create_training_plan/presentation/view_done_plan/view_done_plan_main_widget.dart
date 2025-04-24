import 'dart:io';
import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/get_info_exercises_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/controllers/confrim_ready_plan_controller.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/confirm_plan_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/edit_this_day_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/exercises_row_func.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/ready_plan_not_changed_view_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewDonePlanMainWidget extends ConsumerWidget {
  final bool isPlanBeenChanged;
  final List<ReadyTrainingPlanModel>? listOfDaysReadyPlan;

  const ViewDonePlanMainWidget({
    super.key,
    required this.isPlanBeenChanged,
    this.listOfDaysReadyPlan,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonAddedPlanState = ref.watch(confrimReadyPlanControllerProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    AsyncValue<List<ExerciseModel>>? exercisesReadyPlan = ref.watch(
        getInfoExercisesReadyPlanDataProvider(
            listOfDaysReadyPlan?.first.idTrain.toString() ?? ''));
    final tempTrainProv = ref.watch(tempTrainPlanProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        dir.when(
          data: (readyPlans) {
            if (!isPlanBeenChanged) {
              return exercisesReadyPlan!.when(
                data: (exercises) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _updateTempPlainProvider(
                        ref: ref,
                        exercises: exercises,
                        listOfDaysReadyPlan: listOfDaysReadyPlan!);
                  });
                  return ReadyPlanExercisesNotChangedPlan(
                    listOfDaysReadyPlan: listOfDaysReadyPlan!,
                    buttonAddedPlanState: buttonAddedPlanState,
                    dir: dir,
                    exercises: exercises,
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(
                    left: 33,
                    right: 33,
                    top: MediaQuery.of(context).size.height * 0.125),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 61),
                  itemCount: tempTrainProv.exercisesByWeekday.length + 1,
                  itemBuilder: (context, index) {
                    // Кнопка сохранения плана после ListView
                    if (index == tempTrainProv.exercisesByWeekday.length) {
                      return ButtonConfirmPlan(
                          buttonAddedPlanState: buttonAddedPlanState);
                    }
                    final weekday =
                        tempTrainProv.exercisesByWeekday.keys.elementAt(index);
                    return _buildDayItemChangedPlan(
                      weekday: weekday,
                      exercises: tempTrainProv.exercisesByWeekday[weekday]!,
                      dir: dir.value!,
                      context: context,
                      dayExerciseIds: tempTrainProv.exercisesByWeekday[weekday]!
                          .map((e) => e.id.toString())
                          .toList(),
                    );
                  },
                ),
              );
            }
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget _buildDayExercises({
    required List<String?> dayExercises,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required String weekday,
    required BuildContext context,
  }) {
    final firstRow = dayExercises.take(3).toList();
    final secondRow = dayExercises.skip(3).take(2).toList();
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          exercisesRow(
            dayExercises: firstRow,
            exercises: exercises,
            dir: dir,
            firstLine: true,
            context: context,
          ),
          if (secondRow.isNotEmpty)
            exercisesRow(
              dayExercises: secondRow,
              exercises: exercises,
              dir: dir,
              firstLine: false,
              context: context,
            ),
          EditThisDayButton(
            weekday: weekday,
            dir: dir,
          )
        ],
      ),
    );
  }

  Widget _buildDayItemChangedPlan({
    required String weekday,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required BuildContext context,
    required List<String?> dayExerciseIds,
  }) {
    return Column(
      children: [
        RuWeekdayTrainPlan(weekday: weekday),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.1),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Center(
              child: _buildDayExercises(
                dayExercises: dayExerciseIds,
                exercises: exercises,
                dir: dir,
                weekday: weekday,
                context: context,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _updateTempPlainProvider(
      {required WidgetRef ref,
      required List<ExerciseModel> exercises,
      required List<ReadyTrainingPlanModel> listOfDaysReadyPlan}) {
    final tempPlanNotifier = ref.read(tempTrainPlanProvider.notifier);
    // Очищаем предыдущие данные
    tempPlanNotifier.reset();

    for (final day in listOfDaysReadyPlan) {
      final dayExercises = [
        day.exOne,
        day.exTwo,
        day.exThree,
        day.exFour,
        day.exFive
      ];

      for (var exId in dayExercises) {
        if (exId != null) {
          final exercise = exercises.firstWhere(
            (ex) => ex.id.toString() == exId,
            orElse: () => throw Exception('Exercise $exId not found'),
          );
          tempPlanNotifier.addExercise(
            weekday: day.weekday,
            exercise: exercise,
          );
        }
      }
    }
  }
}
