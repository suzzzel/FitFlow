import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_exercise_domain_future_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoTheTrainMainWidget extends ConsumerStatefulWidget {
  const DoTheTrainMainWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DoTheTrainMainWidgetState();
}

class _DoTheTrainMainWidgetState extends ConsumerState<DoTheTrainMainWidget> {
  bool isMainInstructionsOpen = false;
  List<bool> stepOfInstructionsOpen = [];
  List<String> instructions = [];
  void _skipEx({required int tempExercise, required TempTrainModel train}) {
    setState(() {
      ref
          .read(tempTrainStateNotifierProvider.notifier)
          .skipExercise(tempExercise: tempExercise);
      ref.read(completeTrainProvider).nextExercise(train: train);
      ref.invalidate(tempExerciseFutureProvider);
      stepOfInstructionsOpen = [];
      instructions = [];
    });
  }

  String getTempEx({required int tempExercise, required TempTrainModel train}) {
    switch (tempExercise) {
      case 1:
        return train.exerciseOne;
      case 2:
        return train.exerciseTwo!;
      case 3:
        return train.exerciseThree!;
      case 4:
        return train.exerciseFour!;
      case 5:
        return train.exerciseFive!;
      default:
        return '1';
    }
  }

  void getInstructions({required ExerciseModel exercise}) {
    if (instructions.isEmpty) {
      final getInst = exercise.getInstructions();
      instructions = getInst;
      stepOfInstructionsOpen =
          List<bool>.generate(instructions.length, (int index) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    return trainNotifier != TempTrainModel.empty()
        ? trainNotifier.getExercise().length >= trainNotifier.tempExercise
            ? ListView(
                children: [
                  dir.when(
                      data: (gifDirectory) {
                        AsyncValue<ExerciseModel> tempExercise = ref.watch(
                            tempExerciseFutureProvider(getTempEx(
                                tempExercise: trainNotifier.tempExercise,
                                train: trainNotifier)));
                        final exGifID = getTempEx(
                                tempExercise: trainNotifier.tempExercise,
                                train: trainNotifier)
                            .padLeft(4, '0');
                        final gifEx =
                            File('${gifDirectory.path}/exGifs/$exGifID.gif');
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Image.file(
                                gifEx,
                              ),
                            ),
                            tempExercise.when(
                                data: (exercise) {
                                  final secondaryMuscles =
                                      exercise.getSecondaryMuscles();
                                  getInstructions(exercise: exercise);
                                  return Column(
                                    children: [
                                      Container(
                                        color: Colors.pink,
                                        child: Text(exercise.name),
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: 250, child: TextField()),
                                            SizedBox(
                                              width: 100,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child:
                                                      Text('Сделать подход')),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.yellowAccent,
                                        child: Text(
                                            'Главная мышца: ${exercise.target}'),
                                      ),
                                      Container(
                                        color: Colors.yellow,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children:
                                                secondaryMuscles.isNotEmpty
                                                    ? List.generate(
                                                        secondaryMuscles.length,
                                                        (int index) {
                                                          if (index ==
                                                              secondaryMuscles
                                                                      .length -
                                                                  1) {
                                                            return Text(
                                                                '${secondaryMuscles[index]}.');
                                                          } else {
                                                            return Text(
                                                                '${secondaryMuscles[index]}, ');
                                                          }
                                                        },
                                                      )
                                                    : [
                                                        const Text(
                                                            'Второстепенные мышцы отсутствуют')
                                                      ]),
                                      ),
                                      ExpansionPanelList(
                                        expansionCallback:
                                            (panelIndex, isExpanded) {
                                          setState(() {
                                            isMainInstructionsOpen = isExpanded;
                                          });
                                        },
                                        children: [
                                          ExpansionPanel(
                                              isExpanded:
                                                  isMainInstructionsOpen,
                                              canTapOnHeader: true,
                                              headerBuilder: (context, isOpen) {
                                                return Text(
                                                    'Инструкция к выполнению');
                                              },
                                              body: Column(
                                                children: List.generate(
                                                    stepOfInstructionsOpen
                                                        .length, (int index) {
                                                  return ExpansionPanelList(
                                                    expansionCallback:
                                                        (panelIndex,
                                                            isExpanded) {
                                                      setState(() {
                                                        stepOfInstructionsOpen[
                                                            index] = isExpanded;
                                                      });
                                                    },
                                                    children: [
                                                      ExpansionPanel(
                                                          isExpanded:
                                                              stepOfInstructionsOpen[
                                                                  index],
                                                          headerBuilder:
                                                              (context,
                                                                  isOpen) {
                                                            return Text(
                                                                'Шаг №$index');
                                                          },
                                                          body: Text(
                                                              instructions[
                                                                  index]))
                                                    ],
                                                  );
                                                }),
                                              )),
                                        ],
                                      )
                                    ],
                                  );
                                },
                                error: (_, st) => Text('error'),
                                loading: () => CircularProgressIndicator())
                          ],
                        );
                      },
                      error: (_, st) => Text('error'),
                      loading: () => CircularProgressIndicator()),
                  ElevatedButton(
                      onPressed: () {
                        log(trainNotifier.toString());
                        _skipEx(
                            tempExercise: trainNotifier.tempExercise,
                            train: trainNotifier);
                      },
                      child: Text('SKIP EXERCISE')),
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(completeTrainProvider)
                            .completeTrainAndExit(train: trainNotifier);
                      },
                      child: Text('SAVE TRAIN'))
                ],
              )
            : Container(
                color: Colors.green,
                child: Center(
                  child: trainNotifier.isTrainWasAllSkipped()
                      ? Text('all train was skipepd')
                      : Text('good job!'),
                ),
              )
        : Center(child: CircularProgressIndicator());
  }
}
