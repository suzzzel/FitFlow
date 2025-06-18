import 'dart:io';
import 'dart:math';
import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/cout_of_reps_in_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/max_weight_on_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_exercise_domain_future_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/cout_of_reps_and_max_weight_info.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/do_the_rep_in_train.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/image_in_train.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/instructions_components/step_body.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/instructions_components/step_number_header.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/instructions_components/whole_instructions_header.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/max_weight_input_in_train.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/name_of_exercise_in_train.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/secondary_muscle_in_train.dart';
import 'package:fitflow/features/train/do_the_train/presentation/train/components/target_muscle_in_train.dart';
import 'package:flutter/material.dart';
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
      ref.read(tempTrainStateNotifierProvider.notifier).skipExercise();
      ref.invalidate(tempExerciseFutureProvider);
      stepOfInstructionsOpen = [];
      instructions = [];
      final train = ref.read(tempTrainStateNotifierProvider);
      if (train.getExercise().length < train.tempExercise &&
          train.isTrainWasAllSkipped()) {
        ref.read(completeTrainProvider).exitFromTrainWithoutSaving();
        context.goNamed('emptycompletetrain');
      } else if (train.getExercise().length < train.tempExercise) {
        ref.read(completeTrainProvider).completeTrain(train: train);
        context.goNamed('completetrain');
      }
    });
  }

  void _completeExercise({
    required String? maxWeight,
    required int countOfReps,
  }) {
    setState(() {
      ref.read(tempTrainStateNotifierProvider.notifier).completeExercise(
          maxWeightOnThatExercise: maxWeight ?? '0',
          countOfRepsOnThatExercise: countOfReps);
      ref
          .read(completeTrainProvider)
          .nextExercise(train: ref.read(tempTrainStateNotifierProvider));
      ref.invalidate(coutOfRepsInTempExerciseProvider);
      ref.invalidate(maxWeightOnTempExerciseProvider);
      final train = ref.read(tempTrainStateNotifierProvider);
      if (train.getExercise().length < train.tempExercise &&
          !train.isTrainWasAllSkipped()) {
        ref.read(completeTrainProvider).completeTrain(train: train);
        context.goNamed('completetrain');
      } else if (train.getExercise().length < train.tempExercise) {
        ref.read(completeTrainProvider).exitFromTrainWithoutSaving();
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
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.125),
                child: ListView(
                  padding: EdgeInsets.zero,
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
                                              secondaryMuscles:
                                                  secondaryMuscles),
                                          _instructionsWidgetInTrain(context),
                                          CoutOfRepsAndMaxWeightInfo(
                                              countOfReps: countOfReps,
                                              tempMaxWeight: tempMaxWeight),
                                        ],
                                      ),
                                    );
                                  },
                                  error: (_, st) =>
                                      const SomethingGoesWrongWidget(),
                                  loading: () =>
                                      const CircularProgressIndicator())
                            ],
                          );
                        },
                        error: (_, st) => const SomethingGoesWrongWidget(),
                        loading: () => const CircularProgressIndicator()),
                    _nextStepInsideTrainButton(
                        countOfReps, context, trainNotifier, tempMaxWeight),
                  ],
                ),
              )
            : const SizedBox()
        : const Center(child: CircularProgressIndicator());
  }

  Padding _instructionsWidgetInTrain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryFixed,
                    Theme.of(context).colorScheme.secondaryFixed,
                  ]),
              borderRadius: BorderRadius.circular(24)),
          child: ExpansionPanelList(
            elevation: 0,
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                isMainInstructionsOpen = isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                  backgroundColor: Colors.transparent,
                  isExpanded: isMainInstructionsOpen,
                  canTapOnHeader: true,
                  headerBuilder: (context, isOpen) {
                    return const WholeInstructionsStepsHeader();
                  },
                  body: Column(
                    children: List.generate(stepOfInstructionsOpen.length,
                        (int index) {
                      return ExpansionPanelList(
                        materialGapSize: 10,
                        elevation: 0,
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            stepOfInstructionsOpen[index] = isExpanded;
                          });
                        },
                        children: [
                          ExpansionPanel(
                              backgroundColor: Colors.transparent,
                              isExpanded: stepOfInstructionsOpen[index],
                              headerBuilder: (context, isOpen) {
                                return StepNumberInTrainHeader(
                                  index: index + 1,
                                );
                              },
                              body: StepInTrainBody(
                                instructions: instructions,
                                index: index,
                              ))
                        ],
                      );
                    }),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Padding _nextStepInsideTrainButton(int countOfReps, BuildContext context,
      TempTrainModel trainNotifier, String? tempMaxWeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(
                colors: countOfReps <= 0
                    ? [
                        Theme.of(context).colorScheme.error,
                        Theme.of(context).colorScheme.errorContainer,
                      ]
                    : [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary,
                      ],
                transform: const GradientRotation(pi / 2))),
        child: ElevatedButton(
            onPressed: () {
              countOfReps <= 0
                  ? _skipEx(
                      tempExercise: trainNotifier.tempExercise,
                    )
                  : _completeExercise(
                      maxWeight: tempMaxWeight,
                      countOfReps: countOfReps,
                    );
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: Text(
              countOfReps <= 0
                  ? 'Пропустить упражнение'
                  : 'Следующее упражнение',
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
