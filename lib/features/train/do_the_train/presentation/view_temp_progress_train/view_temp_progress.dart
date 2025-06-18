import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/view_progress_temp_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/back_to_train_in_view_progress.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/count_of_reps_in_view_progress.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/exercise_was_skipped.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/max_weight_in_exercise.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/name_of_ex_in_view_progress.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/temp_progress_header.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_temp_progress_train/components/waiting_complete_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTempProgressMainWidget extends ConsumerWidget {
  const ViewTempProgressMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    final AsyncValue<List<ExerciseModel>> exercises =
        ref.watch(viewTempProgressTempTrainProvider(trainNotifier));
    final trainExerciesInfo = trainNotifier.getInfoAboutThisTrain();
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 370,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TempProgressHeader(),
                  exercises.when(
                      data: (exercises) => ExerciseInfoInViewProgress(
                            trainExerciesInfo: trainExerciesInfo,
                            exercises: exercises,
                          ),
                      error: (_, st) => Text(
                          'Что - то пошло не так.\nПопробуйте попробовать снова.',
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                      loading: () => const CircularProgressIndicator()),
                  const BackToTrainButtonInViewProgress()
                ],
              ),
            ),
          )),
    );
  }
}

class ExerciseInfoInViewProgress extends StatelessWidget {
  const ExerciseInfoInViewProgress(
      {super.key, required this.trainExerciesInfo, required this.exercises});

  final Map<String, List<String?>> trainExerciesInfo;
  final List<ExerciseModel> exercises;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView(
        children: List.generate(
            exercises.length,
            (int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primaryFixedDim
                                .withOpacity(0.3),
                            Theme.of(context)
                                .colorScheme
                                .secondaryFixedDim
                                .withOpacity(0.3),
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NameOfExInViewProgress(name: exercises[index].name),
                        trainExerciesInfo['skippedEx']?[index] != 'true'
                            ? const SizedBox()
                            : const ExerciseWasSkipped(),
                        trainExerciesInfo['countOfRepsByEx']?[index] !=
                                    'null' &&
                                trainExerciesInfo['skippedEx']?[index] != 'true'
                            ? CoutOfRepsInfoInViewProgress(
                                coutOfRepInThatExercise:
                                    trainExerciesInfo['countOfRepsByEx']
                                        ?[index],
                              )
                            : trainExerciesInfo['skippedEx']?[index] == 'null'
                                ? const WaitingCompleteExercise()
                                : const SizedBox(),
                        trainExerciesInfo['maxWeightOnEx']?[index] != null &&
                                trainExerciesInfo['skippedEx']?[index] != 'true'
                            ? MaxWeightInExercise(
                                maxWeightOnThatExercise:
                                    trainExerciesInfo['maxWeightOnEx']?[index])
                            : const SizedBox()
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
