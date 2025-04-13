import 'dart:io';
import 'dart:math';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/get_info_exercises_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/controllers/confrim_ready_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDonePlanMainWidget extends ConsumerWidget {
  final bool isThisReadyPlanOrCustom;
  final List<ReadyTrainingPlanModel> listOfDays;
  const ViewDonePlanMainWidget(
      {super.key,
      required this.isThisReadyPlanOrCustom,
      required this.listOfDays});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonAddedPlanState = ref.watch(confrimReadyPlanControllerProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    AsyncValue<List<ExerciseModel>> exercises = ref.watch(
        getInfoExercisesDataProvider(listOfDays.first.idTrain.toString()));
    return Stack(alignment: Alignment.center, children: [
      dir.when(
          data: (readyPlans) {
            if (dir.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return exercises.when(
                  data: (exercises) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.125),
                      // Рисуем отдельно ДЕНЬ в тренировочном плане
                      child: Padding(
                        padding: const EdgeInsets.only(left: 33, right: 33),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 61),
                          itemCount: listOfDays.length + 1,
                          itemBuilder: (context, index) {
                            // Кнопка сохранения плана после ListView
                            if (index == listOfDays.length) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 6, right: 6, top: 32, bottom: 54),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(99)),
                                      gradient: LinearGradient(
                                          colors: [
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ],
                                          transform:
                                              const GradientRotation(pi / 4))),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        final addedPlan = await ref
                                            .read(
                                                confrimReadyPlanControllerProvider
                                                    .notifier)
                                            .confirmReadyPlan(days: listOfDays);
                                        if (addedPlan) {
                                          // ignore: use_build_context_synchronously
                                          context.goNamed('/home');
                                        }
                                      },
                                      style: ButtonStyle(
                                          fixedSize: WidgetStatePropertyAll(
                                              Size(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  60)),
                                          backgroundColor:
                                              const WidgetStatePropertyAll(
                                                  Colors.transparent)),
                                      child: !buttonAddedPlanState.isLoading
                                          ? FittedBox(
                                              child: Text(
                                                'Продолжить',
                                                textScaler:
                                                    const TextScaler.linear(1),
                                                style: GoogleFonts.inter(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          : const CircularProgressIndicator()),
                                ),
                              );
                            } else {
                              // конкретный день в тренировочном плане
                              final thisDay = listOfDays[index];
                              return Column(
                                children: [
                                  Padding(
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
                                          _ruWeekday(listOfDays[index].weekday),
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        )),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
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
                                      child: Center(
                                        child: _buildDayExercises(
                                            thisDay: thisDay,
                                            exercises: exercises,
                                            dir: dir.value!,
                                            context: context),
                                      )),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                  error: (err, stack) => Text('Error: $err'),
                  loading: () => const CircularProgressIndicator());
            }
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator()),
    ]);
  }
}

String _ruWeekday(String weekday) {
  switch (weekday) {
    case 'monday':
      return 'Понедельник';
    case 'tuesday':
      return 'Вторник';
    case 'wednesday':
      return 'Среда';
    case 'thursday':
      return 'Четверг';
    case 'friday':
      return 'Пятница';
    case 'saturday':
      return 'Суббота';
    case 'sunday':
      return 'Воскресенье';
    default:
      return '';
  }
}

Widget _buildDayExercises(
    {required ReadyTrainingPlanModel thisDay,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required BuildContext context}) {
  final dayExercises = [
    thisDay.exOne,
    thisDay.exTwo,
    thisDay.exThree,
    thisDay.exFour,
    thisDay.exFive
  ];
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 58),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _exercisesRow(
            dayExercises: dayExercises.sublist(0, 3),
            exercises: exercises,
            dir: dir,
            context: context),
        const SizedBox(
          height: 15,
        ),
        _exercisesRow(
            dayExercises: dayExercises.sublist(3),
            exercises: exercises,
            dir: dir,
            context: context),
      ],
    ),
  );
}

Widget _exercisesRow(
    {required List<String?> dayExercises,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: dayExercises.map((exId) {
      print(dir.path);
      final exGifFolderPath = '${dir.path}/exGifs';
      if (exId != null) {
        final exName =
            exercises.where((ex) => ex.id.toString() == exId).first.name;
        final exIdGif = exId.padLeft(4, '0');

        final exGifFile = File('$exGifFolderPath/$exIdGif.gif');
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) => LinearGradient(colors: [
                        Theme.of(context)
                            .colorScheme
                            .primaryFixed
                            .withOpacity(0.4),
                        Theme.of(context)
                            .colorScheme
                            .secondaryFixed
                            .withOpacity(0.4),
                      ]).createShader(bounds),
                      child: Image.file(
                        exGifFile,
                        width: 65,
                        height: 65,
                      ),
                      // child: Image.asset(
                      //   exGif,
                      //   width: 65,
                      //   height: 65,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 91,
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
                child: Text(
                  softWrap: true,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  exName,
                  style: GoogleFonts.inter(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }).toList(),
  );
}
