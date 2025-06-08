import 'dart:io';
import 'dart:math';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseSearchWidget extends ConsumerWidget {
  const ExerciseSearchWidget(
      {super.key,
      required this.exGifFile,
      required this.dir,
      required this.exercise,
      required this.isPlanEdit,
      required this.weekday});

  final File exGifFile;
  final Directory dir;
  final ExerciseModel exercise;
  final bool isPlanEdit;
  final String? weekday;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              final secondaryMuscles = exercise.getSecondaryMuscles();
              final instructions = exercise.getInstructions();
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: Colors.transparent,
                contentPadding: const EdgeInsets.all(0),
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.maxFinite,
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ExerciseImage(
                            exGifFile: exGifFile,
                            heightinDetailView:
                                MediaQuery.of(context).size.height * 0.31,
                            widthInDetailView: double.maxFinite),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          exercise.name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              color: Colors.grey.withOpacity(0.3)),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Text(
                                  'Часть тела',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  exercise.bodyPart,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              color: Colors.grey.withOpacity(0.3)),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Text(
                                  'Целевая мышца',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  exercise.target,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              color: Colors.grey.withOpacity(0.3)),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Text(
                                  'Необходимое оборудование',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  exercise.equipment,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      secondaryMuscles.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(99)),
                                    color: Colors.grey.withOpacity(0.3)),
                                child: Column(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        'Вторичные мышцы',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Row(
                                        children: List.generate(
                                          secondaryMuscles.length,
                                          (int index) {
                                            if (index ==
                                                secondaryMuscles.length - 1) {
                                              return Text(
                                                '${secondaryMuscles[index]}.',
                                                style: GoogleFonts.inter(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              );
                                            } else {
                                              return Text(
                                                '${secondaryMuscles[index]}, ',
                                                style: GoogleFonts.inter(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      instructions.isNotEmpty
                          ? Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    'Порядок выполнения',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    instructions.length,
                                    (int index) {
                                      if (index == instructions.length - 1) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(99)),
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                    'Последний шаг',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.inter(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Text(instructions[index],
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.inter(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(99)),
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                    'Шаг ${index + 1}',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.inter(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Text(
                                                  textAlign: TextAlign.center,
                                                  instructions[index],
                                                  style: GoogleFonts.inter(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                actionsPadding: const EdgeInsets.all(8),
                actions: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(99)),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).colorScheme.secondaryFixed,
                          Theme.of(context).colorScheme.primaryFixed,
                        ], transform: const GradientRotation(pi / 2))),
                    child: ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(0),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.transparent)),
                        child: FittedBox(
                          child: Text(
                            'Закрыть',
                            style: GoogleFonts.inter(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  isPlanEdit
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              gradient: LinearGradient(colors: [
                                Theme.of(context).colorScheme.error,
                                Theme.of(context).colorScheme.errorContainer,
                              ], transform: const GradientRotation(pi / 2))),
                          child: ElevatedButton(
                              onPressed: () async {
                                ref
                                    .read(tempTrainPlanProvider.notifier)
                                    .addExercise(
                                        weekday: weekday!, exercise: exercise);
                                context.pop();
                                context.pop();
                              },
                              style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent)),
                              child: FittedBox(
                                child: Text(
                                  'Добавить',
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        )
                      : SizedBox()
                ],
              );
            },
          );
        },
        child: Container(
          height: 200,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExerciseImage(
                exGifFile: exGifFile,
                widthInDetailView: null,
                heightinDetailView: null,
              ),
              Text(
                exercise.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
