import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/cout_of_reps_in_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/max_weight_on_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_exercise_domain_future_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            ImageInTrain(gifEx: gifEx),
                            tempExercise.when(
                                data: (exercise) {
                                  final secondaryMuscles =
                                      exercise.getSecondaryMuscles();
                                  getInstructions(exercise: exercise);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                        NameOfExerciseInTrain(
                                          name: exercise.name,
                                        ),
                                        MaxWeightInputInTrain(
                                            tempMaxWeight: tempMaxWeight),
                                        const DoTheRepInTrain(),
                                        TargetMuscleInTrain(
                                            targetMuscle: exercise.target),
                                        SecondayMusclesInTrain(
                                            secondaryMuscles: secondaryMuscles),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primaryFixed,
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .secondaryFixed,
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24)),
                                              child: ExpansionPanelList(
                                                elevation: 0,
                                                expansionCallback:
                                                    (panelIndex, isExpanded) {
                                                  setState(() {
                                                    isMainInstructionsOpen =
                                                        isExpanded;
                                                  });
                                                },
                                                children: [
                                                  ExpansionPanel(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      isExpanded:
                                                          isMainInstructionsOpen,
                                                      canTapOnHeader: true,
                                                      headerBuilder:
                                                          (context, isOpen) {
                                                        return Center(
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child: FittedBox(
                                                              child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  'Инструкция к выполнению',
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .onSecondary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        20,
                                                                  )),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      body: Column(
                                                        children: List.generate(
                                                            stepOfInstructionsOpen
                                                                .length,
                                                            (int index) {
                                                          return ExpansionPanelList(
                                                            expansionCallback:
                                                                (panelIndex,
                                                                    isExpanded) {
                                                              setState(() {
                                                                stepOfInstructionsOpen[
                                                                        index] =
                                                                    isExpanded;
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
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Colors.green,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                  'Кол-во подходов: $countOfReps'),
                                              Icon(Icons
                                                  .account_balance_outlined),
                                              Text(
                                                  'максимальный вес: ${tempMaxWeight != null ? '$tempMaxWeight kg' : 'не указан'}')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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

class SecondayMusclesInTrain extends StatelessWidget {
  const SecondayMusclesInTrain({
    super.key,
    required this.secondaryMuscles,
  });

  final List<String> secondaryMuscles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.15),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.15),
              ]),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: secondaryMuscles.isNotEmpty
              ? [
                  Text(
                    'Вторичные мышцы: ',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  ...List.generate(
                    secondaryMuscles.length,
                    (int index) {
                      final shader = LinearGradient(colors: [
                        Theme.of(context).colorScheme.primaryFixed,
                        Theme.of(context).colorScheme.secondaryFixed,
                      ]).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
                      if (index == secondaryMuscles.length - 1) {
                        return Text('${secondaryMuscles[index]}.',
                            style: GoogleFonts.inter(
                              foreground: Paint()..shader = shader,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ));
                      } else {
                        return Text('${secondaryMuscles[index]}, ',
                            style: GoogleFonts.inter(
                              foreground: Paint()..shader = shader,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ));
                      }
                    },
                  )
                ]
              : [const Text('Второстепенные мышцы отсутствуют')]),
    );
  }
}

class TargetMuscleInTrain extends StatelessWidget {
  const TargetMuscleInTrain({super.key, required this.targetMuscle});

  final String targetMuscle;
  @override
  Widget build(BuildContext context) {
    final shader = LinearGradient(colors: [
      Theme.of(context).colorScheme.primaryFixed,
      Theme.of(context).colorScheme.secondaryFixed,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primaryFixed.withOpacity(0.15),
                  Theme.of(context)
                      .colorScheme
                      .secondaryFixed
                      .withOpacity(0.15),
                ]),
            borderRadius: BorderRadius.circular(24)),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Главная мышца:',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSecondary),
                children: [
                  TextSpan(
                      text: ' $targetMuscle',
                      style: GoogleFonts.inter(
                        foreground: Paint()..shader = shader,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
                ])),
      ),
    );
  }
}

class DoTheRepInTrain extends ConsumerWidget {
  const DoTheRepInTrain({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ], transform: const GradientRotation(pi / 2))),
        child: ElevatedButton(
            onPressed: () {
              ref.read(coutOfRepsInTempExerciseProvider.notifier).state++;
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: Text(
              'Сделать подход',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}

class MaxWeightInputInTrain extends ConsumerWidget {
  const MaxWeightInputInTrain({
    super.key,
    required this.tempMaxWeight,
  });

  final String? tempMaxWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: CustomTextField(
          controller: TextEditingController(),
          labelText: 'Рабочий вес (опционально)',
          onFieldSubmitted: (value) {
            if (value != '') {
              final tempWeight = int.parse(value);
              final tempMaxWeightInprov = int.parse(tempMaxWeight ?? '0');
              if (tempWeight > tempMaxWeightInprov) {
                ref.read(maxWeightOnTempExerciseProvider.notifier).state =
                    value;

                ref.read(coutOfRepsInTempExerciseProvider.notifier).state++;
              }
            }
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          obscureText: false,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: false),
          isImputRight: true),
    );
  }
}

class NameOfExerciseInTrain extends StatelessWidget {
  const NameOfExerciseInTrain({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ImageInTrain extends StatelessWidget {
  const ImageInTrain({
    super.key,
    required this.gifEx,
  });

  final File gifEx;

  @override
  Widget build(BuildContext context) {
    return gifEx.existsSync()
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                          image: FileImage(gifEx), fit: BoxFit.fill)),
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primaryFixed
                                .withOpacity(0.6),
                            Theme.of(context)
                                .colorScheme
                                .secondaryFixed
                                .withOpacity(0.5),
                          ]),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ],
            ),
          )
        : Image.asset('assets/home/gif_error.gif');
  }
}
