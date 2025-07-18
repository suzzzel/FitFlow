import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_by_day_future_provider.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_future_provider.dart';
import 'package:fitflow/features/progress/presentation/components/circle_in_progress.dart';
import 'package:fitflow/features/progress/presentation/components/day_slider/day_slider_main_widget.dart';
import 'package:fitflow/features/progress/presentation/components/empty_train_info.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainProgressMainWidget extends ConsumerWidget {
  const MainProgressMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<MainProgressModel> mainProgress =
        ref.watch(getMainProgressProvider);
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1), () {
          ref.invalidate(getMainProgressProvider);
          ref.invalidate(getProgressByDayInMainProgressProvider);
        });
      },
      child: mainProgress.when(
          skipLoadingOnRefresh: false,
          data: (mainProgress) {
            if (mainProgress == MainProgressModel.empty()) {
              return const EmptyTrainInfo();
            } else {
              return CustomScrollView(slivers: [
                SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleInProgress(
                                infoAboutCircle:
                                    'Кол-во\nвыполненных\nтренировок',
                                infoIntoCircle:
                                    mainProgress.countOfTrainings.toString(),
                              ),
                              CircleInProgress(
                                  infoAboutCircle:
                                      'Средний %\nвыполнения\nтренировок',
                                  infoIntoCircle:
                                      '${mainProgress.middlePercentOfTrainings}%'),
                              CircleInProgress(
                                infoAboutCircle:
                                    'Кол-во\nподходов за\nвсе время',
                                infoIntoCircle:
                                    mainProgress.countOfRepsAllTime.toString(),
                              ),
                            ],
                          ),
                        ),
                        // конкретные дни
                        DaySliderMainWidget(
                          mainProgress: mainProgress,
                        )
                      ],
                    ),
                  ),
                ),
              ]);
            }
          },
          error: (_, st) => const Center(child: SomethingGoesWrongWidget()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
