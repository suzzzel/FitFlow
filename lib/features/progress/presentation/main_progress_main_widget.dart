import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/providers/current_index_provider.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_by_day_future_provider.dart';
import 'package:fitflow/features/progress/domain/providers/main_progress_future_provider.dart';
import 'package:fitflow/features/progress/presentation/components/circle_in_progress.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MainProgressMainWidget extends ConsumerWidget {
  const MainProgressMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<MainProgressModel> mainProgress =
        ref.watch(getMainProgressProvider);
    final currentDayIndex = ref.watch(currentDayIndexProvider);
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
              return SingleChildScrollView(
                primary: false,
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Text('no train'),
                  ),
                ),
              );
            } else {
              log(mainProgress.toString());
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
                        Padding(
                          padding: EdgeInsets.only(top: 150, bottom: 110),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: const Alignment(0, -0.5),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 65,
                                      child: CarouselSlider(
                                        items: List<Widget>.generate(
                                            mainProgress.listOfTrainings.length,
                                            (int index) => Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: index ==
                                                                  currentDayIndex
                                                              ? [
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primaryFixed,
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondaryFixed
                                                                ]
                                                              : [
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primaryFixed
                                                                      .withOpacity(
                                                                          0.8),
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondaryFixed
                                                                      .withOpacity(
                                                                          0.8),
                                                                ])),
                                                  width: 65,
                                                  height: 65,
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      _translateDate(
                                                          todayMonth: DateFormat
                                                                  .MMM()
                                                              .format(DateTime.parse(mainProgress
                                                                  .listOfTrainings[
                                                                      index]
                                                                  .dayOfTraining
                                                                  .toString())),
                                                          todayDate: DateTime.parse(
                                                                  mainProgress
                                                                      .listOfTrainings[
                                                                          index]
                                                                      .dayOfTraining
                                                                      .toString())
                                                              .day
                                                              .toString()),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1,
                                                          fontSize: index ==
                                                                  currentDayIndex
                                                              ? 36
                                                              : 32),
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
                                            ref
                                                .read(currentDayIndexProvider
                                                    .notifier)
                                                .state = index;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final selectedDay = mainProgress
                                          .listOfTrainings[currentDayIndex];
                                      AsyncValue<List<ExercisesIntoDayModel>>
                                          progressByDay = ref.watch(
                                              getProgressByDayInMainProgressProvider(
                                                  selectedDay));
                                      return progressByDay.when(
                                          skipLoadingOnRefresh: false,
                                          data: (progress) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 173,
                                                  color: Colors.red,
                                                ),
                                                ...List<Widget>.generate(
                                                  progress.length,
                                                  (int index) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primaryFixedDim
                                                                    .withOpacity(
                                                                        0.5),
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondaryFixedDim
                                                                    .withOpacity(
                                                                        0.5)
                                                              ])),
                                                      height: 100,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: Image.file(
                                                                progress[index]
                                                                    .gifExercise),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  progress[
                                                                          index]
                                                                      .exerciceName,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                Text(
                                                                  'Кол-во подходов: ${progress[index].countOfReps.toString()}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                Text(
                                                                  'Максимальный вес: ${progress[index].maxWeight.toString()}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          error: (_, st) =>
                                              SomethingGoesWrongWidget(),
                                          loading: () => Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
            }
          },
          error: (_, st) => SomethingGoesWrongWidget(),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

String _translateDate({required String todayMonth, required String todayDate}) {
  switch (todayMonth) {
    case 'Dec':
      return "$todayDate\nдекабря";
    case 'Jan':
      return "$todayDate\nянваря";
    case 'Feb':
      return "$todayDate\nфевраля";
    case 'Mar':
      return "$todayDate\nмарта";
    case 'Apr':
      return "$todayDate\nапреля";
    case 'May':
      return "$todayDate\nмая";
    case 'Jun':
      return "$todayDate\nиюня";
    case 'Jul':
      return "$todayDate\nиюля";
    case 'Aug':
      return "$todayDate\nавгуста";
    case 'Sept':
      return "$todayDate\nсентября";
    case 'Oct':
      return "$todayDate\nоктября";
    case 'Nov':
      return "$todayDate\nноября";
    default:
      return todayDate;
  }
}
