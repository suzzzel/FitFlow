import 'dart:io';

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
                backgroundColor: Colors.purple,
                title: const Text('Просмотр упражнения'),
                content: Container(
                  color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.maxFinite,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ExerciseImage(
                          exGifFile: exGifFile,
                          heightinDetailView:
                              MediaQuery.of(context).size.height * 0.31,
                          widthInDetailView: double.maxFinite),
                      Text(
                        exercise.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                      Text(
                        'Часть тела',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      Text(
                        exercise.bodyPart,
                        style: GoogleFonts.inter(),
                      ),
                      Text(
                        'Целевая мышца',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      Text(
                        exercise.target,
                        style: GoogleFonts.inter(),
                      ),
                      Text(
                        'Необходимое оборудование',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      Text(
                        exercise.equipment,
                        style: GoogleFonts.inter(),
                      ),
                      secondaryMuscles.isNotEmpty
                          ? Text(
                              'Вторичные мышцы',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(color: Colors.white),
                            )
                          : const SizedBox(),
                      secondaryMuscles.isNotEmpty
                          ? Row(
                              children: List.generate(
                                secondaryMuscles.length,
                                (int index) {
                                  if (index == secondaryMuscles.length - 1) {
                                    return Text('${secondaryMuscles[index]}.');
                                  } else {
                                    return Text('${secondaryMuscles[index]}, ');
                                  }
                                },
                              ),
                            )
                          : const SizedBox(),
                      instructions.isNotEmpty
                          ? Text(
                              'Порядок выполнения',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(color: Colors.white),
                            )
                          : const SizedBox(),
                      instructions.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                instructions.length,
                                (int index) {
                                  if (index == instructions.length - 1) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Последний шаг',
                                          style: GoogleFonts.inter(
                                              color: Colors.white),
                                        ),
                                        Text(instructions[index],
                                            style: GoogleFonts.inter())
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Шаг ${index + 1}',
                                          style: GoogleFonts.inter(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          instructions[index],
                                          style: GoogleFonts.inter(),
                                        )
                                      ],
                                    );
                                  }
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('Закрыть')),
                  isPlanEdit
                      ? ElevatedButton(
                          onPressed: () {
                            ref
                                .read(tempTrainPlanProvider.notifier)
                                .addExercise(
                                    weekday: weekday!, exercise: exercise);
                            context.pop();
                            context.pop();
                          },
                          child: Text('Добавить'))
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
