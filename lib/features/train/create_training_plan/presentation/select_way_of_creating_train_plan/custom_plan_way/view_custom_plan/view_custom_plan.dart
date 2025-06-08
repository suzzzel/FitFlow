import 'dart:io';
import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/view_custom_plan/components/day_with_exercises_in_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/view_custom_plan/components/empty_day_in_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/view_custom_plan/components/save_custom_plan_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewCustomPlan extends ConsumerWidget {
  const ViewCustomPlan({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempTrainProv = ref.watch(tempTrainPlanProvider);
    final weekdaysOrTrain = ref.read(selectWeekdayCustomPlanProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    return dir.when(
        data: (directory) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(weekdaysOrTrain.length,
                            (int indexWeekday) {
                          return Column(
                            children: [
                              RuWeekdayTrainPlan(
                                  weekday: weekdaysOrTrain[indexWeekday]),
                              tempTrainProv.exercisesByWeekday[
                                          weekdaysOrTrain[indexWeekday]] ==
                                      null
                                  ? EmptyDayInCustomPlan(
                                      directory: directory,
                                      weekday: weekdaysOrTrain[indexWeekday])
                                  : DayWithExercisesInCustomPlan(
                                      thisDay: tempTrainProv.exercisesByWeekday[
                                              weekdaysOrTrain[indexWeekday]]!
                                          .take(5)
                                          .map((exercise) =>
                                              exercise.id.toString())
                                          .toList(),
                                      context: context,
                                      dir: directory,
                                      exercises:
                                          tempTrainProv.exercisesByWeekday[
                                              weekdaysOrTrain[indexWeekday]]!,
                                      weekday: weekdaysOrTrain[indexWeekday])
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              SaveCustomPlanButton(
                  weekdaysOrTrain: weekdaysOrTrain,
                  tempTrainProv: tempTrainProv)
            ],
          );
        },
        error: (err, stack) => const SomethingGoesWrongWidget(),
        loading: () => const CircularProgressIndicator());
  }
}
