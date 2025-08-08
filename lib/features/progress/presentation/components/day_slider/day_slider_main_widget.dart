import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/providers/current_index_provider.dart';
import 'package:fitflow/features/progress/presentation/components/current_day/current_exercise_in_day/current_exercise_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DaySliderMainWidget extends ConsumerWidget {
  final MainProgressModel mainProgress;
  const DaySliderMainWidget({super.key, required this.mainProgress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDayIndex = ref.watch(currentDayIndexProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 110),
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
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: index == currentDayIndex
                                          ? [
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primaryFixed
                                                  .withOpacity(0.8),
                                              Theme.of(context)
                                                  .colorScheme
                                                  .secondaryFixed
                                                  .withOpacity(0),
                                            ]
                                          : [
                                              Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryFixed
                                                  .withOpacity(0.8),
                                              Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryFixed
                                                  .withOpacity(0),
                                            ])),
                              width: 65,
                              height: 65,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _translateDate(
                                      todayMonth: DateFormat.MMM().format(
                                          DateTime.parse(mainProgress
                                              .listOfTrainings[index]
                                              .dayOfTraining
                                              .toString())),
                                      todayDate: DateTime.parse(mainProgress
                                              .listOfTrainings[index]
                                              .dayOfTraining
                                              .toString())
                                          .day
                                          .toString()),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                      fontSize:
                                          index == currentDayIndex ? 36 : 32),
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
              CurrentExerciseMainWidget(
                mainProgress: mainProgress,
              )
            ],
          ),
        ],
      ),
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
