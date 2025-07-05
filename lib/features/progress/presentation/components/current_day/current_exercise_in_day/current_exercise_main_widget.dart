import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/models/progress_in_day_model.dart';
import 'package:fitflow/features/progress/domain/providers/current_index_provider.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_by_day_future_provider.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/count_of_completed_exercise.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/current_exercise_in_day/components/gif_exercise_in_progress.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/current_exercise_in_day/text_info_about_exercise.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/percent_of_complete_in_progress.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentExerciseMainWidget extends ConsumerWidget {
  const CurrentExerciseMainWidget({super.key, required this.mainProgress});
  final MainProgressModel mainProgress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDayIndex = ref.watch(currentDayIndexProvider);
    final selectedDay = mainProgress.listOfTrainings[currentDayIndex];
    AsyncValue<List<ExercisesIntoDayModel>> progressByDay =
        ref.watch(getProgressByDayInMainProgressProvider(selectedDay));
    return progressByDay.when(
        skipLoadingOnRefresh: false,
        data: (progress) {
          final resultInDay = ProgressInDayModel(exercise: progress);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 173,
                child: Align(
                  alignment: const Alignment(0, -0.4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CountOfCompetedExerciseInDay(resultInDay: resultInDay),
                      const SizedBox(
                        height: 15,
                      ),
                      PercentOfCompleteInProgressDay(
                          percent:
                              '${mainProgress.listOfTrainings[currentDayIndex].percentOfTrainDone}')
                    ],
                  ),
                ),
              ),
              ...List<Widget>.generate(
                progress.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(right: 22, bottom: 46),
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GifExerciseInProgress(
                          gif: progress[index].gifExercise,
                        ),
                        InfoAboutExerciseInProgress(
                          maxWeight: progress[index].maxWeight,
                          reps: progress[index].countOfReps.toString(),
                          name: progress[index]
                                  .exerciceName
                                  .substring(0, 1)
                                  .toUpperCase() +
                              progress[index].exerciceName.substring(1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (_, st) => const SomethingGoesWrongWidget(),
        loading: () => const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
