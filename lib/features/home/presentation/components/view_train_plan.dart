import 'dart:io';
import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/home/domain/providers/get_ex_train_plan_future.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/exercises_row_func.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

const weekDays = [
  "monday",
  "tuesday",
  "wednesday",
  "thursday",
  "friday",
  "saturday",
  "sunday"
];

final positions = weekDays.asMap().map((ind, day) => MapEntry(day, ind));

class ViewTrainPlanInHomeWidget extends ConsumerStatefulWidget {
  const ViewTrainPlanInHomeWidget({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewTrainPlanInHomeWidgetState();
}

class _ViewTrainPlanInHomeWidgetState
    extends ConsumerState<ViewTrainPlanInHomeWidget> {
  bool isPlanOpen = false;

  @override
  Widget build(BuildContext context) {
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    AsyncValue<Map<String, List<ExerciseModel>>> trainingPlan =
        ref.watch(getExInfoTrainingPlanProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 37, right: 29, top: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.5,
                color: Theme.of(context).colorScheme.secondaryFixed),
            color: const Color.fromRGBO(42, 44, 56, 1),
            borderRadius: BorderRadius.circular(20)),
        child: dir.when(
            data: (directory) {
              return trainingPlan.when(
                  data: (plan) {
                    return ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 100),
                      expandIconColor:
                          Theme.of(context).colorScheme.secondaryFixed,
                      elevation: 0,
                      expansionCallback: (panelIndex, isExpanded) async {
                        final scrollPos1 =
                            widget.scrollController.position.maxScrollExtent;
                        setState(() {
                          isPlanOpen = isExpanded;
                        });
                        if (isExpanded == true) {
                          widget.scrollController.animateTo(scrollPos1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        } else {
                          final scrollPos =
                              widget.scrollController.position.minScrollExtent;
                          widget.scrollController.animateTo(scrollPos,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      },
                      children: [
                        ExpansionPanel(
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            isExpanded: isPlanOpen,
                            canTapOnHeader: true,
                            headerBuilder: (context, isOpen) {
                              return Center(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                    ),
                                    child: ShaderMask(
                                        blendMode: BlendMode.srcATop,
                                        shaderCallback: (bounds) =>
                                            LinearGradient(colors: [
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primaryFixed,
                                              Theme.of(context)
                                                  .colorScheme
                                                  .secondaryFixed,
                                            ]).createShader(bounds),
                                        child: Text(
                                          'Мой тренировочный план',
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ))),
                              );
                            },
                            body: Builder(builder: (context) {
                              final sortedKeysPlan = plan.keys.toList()
                                ..sort((a, b) => weekDays
                                    .indexOf(a)
                                    .compareTo(weekDays.indexOf(b)));
                              final sortedMap = {
                                for (var e in sortedKeysPlan) e: plan[e]!
                              };
                              return Column(
                                  children: List.generate(sortedMap.keys.length,
                                      (int index) {
                                final exerciseInDay = sortedMap.entries
                                    .elementAt(index)
                                    .value
                                    .take(5)
                                    .map((exercise) => exercise.id.toString())
                                    .toList();
                                final thisDayList = List<String?>.generate(
                                    5,
                                    (index) => index < exerciseInDay.length
                                        ? exerciseInDay[index]
                                        : null);
                                return Column(
                                  children: [
                                    RuWeekdayTrainPlan(
                                      weekday: sortedMap.keys.elementAt(index),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        exercisesRow(
                                            dayExercises:
                                                thisDayList.sublist(0, 3),
                                            exercises: sortedMap.entries
                                                .elementAt(index)
                                                .value,
                                            dir: directory,
                                            firstLine: true,
                                            context: context),
                                        exercisesRow(
                                            dayExercises:
                                                thisDayList.sublist(3),
                                            exercises: sortedMap.entries
                                                .elementAt(index)
                                                .value,
                                            firstLine: false,
                                            dir: directory,
                                            context: context),
                                      ],
                                    )
                                  ],
                                );
                              }));
                            })),
                      ],
                    );
                  },
                  error: (e, st) => const SomethingGoesWrongWidget(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()));
            },
            error: (e, st) => const SomethingGoesWrongWidget(),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
