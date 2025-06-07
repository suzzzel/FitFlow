import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/cout_of_reps_in_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/max_weight_on_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_exercise_domain_future_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  void _skipEx({required int tempExercise}) {
    setState(() {
      ref
          .read(tempTrainStateNotifierProvider.notifier)
          .skipExercise(tempExercise: tempExercise);
      ref.invalidate(tempExerciseFutureProvider);
      stepOfInstructionsOpen = [];
      instructions = [];
      final train = ref.read(tempTrainStateNotifierProvider);
      if (train.getExercise().length == tempExercise &&
          train.isTrainWasAllSkipped()) {
        context.goNamed('emptycompletetrain');
      } else if (train.getExercise().length == tempExercise) {
        context.goNamed('completetrain');
      }
    });
  }

  void _completeExercise(
      {required String? maxWeight,
      required int countOfReps,
      required TempTrainModel train}) {
    setState(() {
      ref.read(tempTrainStateNotifierProvider.notifier).completeExercise(
          maxWeightOnThatExercise: maxWeight ?? '0',
          countOfRepsOnThatExercise: countOfReps);
      ref.read(completeTrainProvider).nextExercise(train: train);
      ref.invalidate(coutOfRepsInTempExerciseProvider);
      ref.invalidate(maxWeightOnTempExerciseProvider);
      if (train.getExercise().length == train.tempExercise &&
          !train.isTrainWasAllSkipped()) {
        context.goNamed('completetrain');
      } else if (train.getExercise().length == train.tempExercise) {
        context.goNamed('emptycompletetrain');
      }
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
    final tempMaxWeight = ref.watch(maxWeightOnTempExerciseProvider);
    final countOfReps = ref.watch(coutOfRepsInTempExerciseProvider);
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
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: gifEx.existsSync()
                                    ? Image.file(gifEx)
                                    : Image.asset('assets/home/gif_error.gif')),
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
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: TextFormField(
                                                  onChanged: (value) {
                                                    if (value != '') {
                                                      final tempWeight =
                                                          int.parse(value);
                                                      final tempMaxWeightInprov =
                                                          int.parse(
                                                              tempMaxWeight ??
                                                                  '0');
                                                      if (tempWeight >
                                                          tempMaxWeightInprov) {
                                                        ref
                                                            .read(
                                                                maxWeightOnTempExerciseProvider
                                                                    .notifier)
                                                            .state = value;
                                                        log(ref
                                                            .read(
                                                                maxWeightOnTempExerciseProvider
                                                                    .notifier)
                                                            .state!);
                                                      }
                                                    }
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintMaxLines: 2,
                                                      hintStyle: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                      hintText:
                                                          'Рабочий вес в подходе\n(опционально)'),
                                                )),
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(
                                                            coutOfRepsInTempExerciseProvider
                                                                .notifier)
                                                        .state++;
                                                  },
                                                  child: Text(
                                                    'Сделать подход',
                                                    textAlign: TextAlign.center,
                                                  )),
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
                                      ),
                                      Container(
                                        color: Colors.green,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                'Кол-во подходов: $countOfReps'),
                                            Icon(
                                                Icons.account_balance_outlined),
                                            Text(
                                                'максимальный вес: ${tempMaxWeight != null ? '$tempMaxWeight kg' : 'не указан'}')
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                error: (_, st) => Text('error'),
                                loading: () => CircularProgressIndicator())
                          ],
                        );
                      },
                      error: (_, st) => Text('error'),
                      loading: () => const CircularProgressIndicator()),
                  ElevatedButton(
                      onPressed: () {
                        countOfReps <= 0
                            ? _skipEx(
                                tempExercise: trainNotifier.tempExercise,
                              )
                            : _completeExercise(
                                maxWeight: tempMaxWeight,
                                countOfReps: countOfReps,
                                train: trainNotifier);
                      },
                      child: countOfReps <= 0 ? Text('skip') : Text('cont')),
                ],
              )
            : SizedBox()
        : const Center(child: CircularProgressIndicator());
  }
}
