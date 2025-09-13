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
                        setState(() {
                          isPlanOpen = isExpanded;
                        });
                        if (isExpanded == true) {
                          await Future.delayed(
                              const Duration(milliseconds: 150));
                          widget.scrollController.animateTo(
                              widget.scrollController.position.maxScrollExtent *
                                  0.45,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          widget.scrollController.animateTo(
                              widget.scrollController.position.minScrollExtent,
                              duration: const Duration(milliseconds: 500),
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
                              final sortedExercise = {
                                for (var e in sortedKeysPlan) e: plan[e]!
                              };
                              return Column(
                                  children: List.generate(
                                      sortedExercise.keys.length, (int index) {
                                final exerciseInDay = sortedExercise.entries
                                    .elementAt(index)
                                    .value
                                    .take(5)
                                    .map((exercise) => exercise.id.toString())
                                    .toList();
                                final idExercise = List<String?>.generate(
                                    5,
                                    (index) => index < exerciseInDay.length
                                        ? exerciseInDay[index]
                                        : null);
                                return DayInViewTrainPlan(
                                  dir: directory,
                                  idExerciseInDay: idExercise,
                                  exerciseInDay: sortedExercise.entries
                                      .elementAt(index)
                                      .value,
                                  dayName: sortedExercise.keys.elementAt(index),
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

class DayInViewTrainPlan extends StatelessWidget {
  const DayInViewTrainPlan(
      {super.key,
      required this.idExerciseInDay,
      required this.dayName,
      required this.dir,
      required this.exerciseInDay});

  final List<ExerciseModel> exerciseInDay;
  final List<String?> idExerciseInDay;
  final String dayName;
  final Directory dir;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RuWeekdayTrainPlan(
          weekday: dayName,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            exercisesRow(
                idExercies: idExerciseInDay.sublist(0, 3),
                exercises: exerciseInDay,
                dir: dir,
                firstLine: true,
                context: context),
            exercisesRow(
                idExercies: idExerciseInDay.sublist(3),
                exercises: exerciseInDay,
                firstLine: false,
                dir: dir,
                context: context),
          ],
        )
      ],
    );
  }
}
