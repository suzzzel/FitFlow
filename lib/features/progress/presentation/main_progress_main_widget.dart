import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/providers/current_index_provider.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_by_day_future_provider.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_future_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainProgressMainWidget extends ConsumerWidget {
  const MainProgressMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<MainProgressModel> mainProgress =
        ref.watch(getMainProgressProvider);
    final currentDayIndex = ref.watch(currentDayIndexProvider);
    return mainProgress.when(
        data: (mainProgress) {
          log(mainProgress.toString());
          return Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleInProgress(
                        infoAboutCircle: 'Кол-во\nвыполненных\nтренировок',
                        infoIntoCircle:
                            mainProgress.countOfTrainings.toString(),
                      ),
                      CircleInProgress(
                          infoAboutCircle: 'Средний %\nвыполнения\nтренировок',
                          infoIntoCircle:
                              '${mainProgress.middlePercentOfTrainings}%'),
                      CircleInProgress(
                        infoAboutCircle: 'Кол-во\nподходов за\nвсе время',
                        infoIntoCircle:
                            mainProgress.countOfRepsAllTime.toString(),
                      ),
                    ],
                  ),
                ),
                // конкретные дни
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: Container(
                    color: Colors.green.withOpacity(0.3),
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: CarouselSlider(
                      items: List<Widget>.generate(
                          mainProgress.listOfTrainings.length,
                          (int index) => Container(
                                width: 65,
                                height: 65,
                                color: Colors.purple,
                                child: Center(
                                  child: Text(
                                    mainProgress
                                        .listOfTrainings[index].dayOfTraining
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )),
                      options: CarouselOptions(
                        viewportFraction: 0.3,
                        pageSnapping: true,
                        enlargeFactor: 0.3,
                        enableInfiniteScroll: true,
                        initialPage: currentDayIndex,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          ref.read(currentDayIndexProvider.notifier).state =
                              index;
                        },
                      ),
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final selectedDay =
                        mainProgress.listOfTrainings[currentDayIndex];
                    AsyncValue<List<ExercisesIntoDayModel>> progressByDay =
                        ref.watch(getProgressByDayInMainProgressProvider(
                            selectedDay));
                    return progressByDay.when(
                        data: (progress) {
                          return SizedBox(
                            height: 250,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.red,
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.file(progress[index].gifExercise),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              progress[index].exerciceName,
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              'Кол-во подходов: ${progress[index].countOfReps.toString()}',
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              'Максимальный вес: ${progress[index].maxWeight.toString()}',
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              itemCount: progress.length,
                            ),
                          );
                        },
                        error: (_, st) => SomethingGoesWrongWidget(),
                        loading: () => Center(
                              child: CircularProgressIndicator(),
                            ));
                  },
                ),
              ],
            ),
          );
        },
        error: (_, st) => SomethingGoesWrongWidget(),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class CircleInProgress extends StatelessWidget {
  const CircleInProgress(
      {super.key, required this.infoAboutCircle, required this.infoIntoCircle});

  final String infoAboutCircle;
  final String infoIntoCircle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryFixed.withOpacity(0.8),
                    Theme.of(context)
                        .colorScheme
                        .secondaryFixed
                        .withOpacity(0.8),
                  ])),
          child: FittedBox(
            child: Text(infoIntoCircle,
                style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: Text(
              infoAboutCircle,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
