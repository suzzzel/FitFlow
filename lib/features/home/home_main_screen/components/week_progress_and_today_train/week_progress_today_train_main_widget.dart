import 'dart:developer';

import 'package:fitflow/features/home/home_main_screen/components/week_progress_and_today_train/components/info_about_today_day/info_about_today.dart';
import 'package:fitflow/features/home/home_main_screen/components/week_progress_and_today_train/components/info_about_today_day/info_about_today_buttons.dart';
import 'package:fitflow/features/home/home_main_screen/components/week_progress_and_today_train/components/loading_home_train_today.dart';
import 'package:fitflow/features/home/home_main_screen/components/week_progress_and_today_train/components/page_indicator_home_screen.dart';
import 'package:fitflow/features/home/home_main_screen/components/week_progress_and_today_train/progress_temp_week_main_widget.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/providers/get_temp_week_progress_domain_provider.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/providers/get_today_train_info_domain_provider.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

class WeekProgressTodayTrainMainWidget extends ConsumerStatefulWidget {
  final List<TrainingPlanClass>? trainingPlan;
  final bool isPlanLoading;
  final String todayDate;
  const WeekProgressTodayTrainMainWidget(
      {super.key,
      required this.todayDate,
      required this.isPlanLoading,
      required this.trainingPlan});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeekProgressTodayTrainMainWidgetState();
}

class _WeekProgressTodayTrainMainWidgetState
    extends ConsumerState<WeekProgressTodayTrainMainWidget> {
  @override
  Widget build(BuildContext context) {
    final timeNow = DateTime.now();
    final weekDayNow = DateFormat('EEEE').format(timeNow).toLowerCase();
    final progressList =
        ref.watch(getTempWeekProgressDomainProviderAsyncProvider);
    double screenPad = 16.0;
    double screenWidth = MediaQuery.of(context).size.width;
    final pageDotController =
        PageController(viewportFraction: 1 + (screenPad * 2 / screenWidth));
    final todayTrain = ref.watch(getTodayTrainInfoDomainProviderAsyncProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 37, right: 29),
      child: SizedBox(
        height: 226,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 218,
              child: progressList.isLoading
                  ? const LoadingHomeTrainToday()
                  : PageView(
                      controller: pageDotController,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenPad, right: screenPad),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(42, 44, 56, 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                InfoAboutToday(
                                  todayTrain: todayTrain,
                                  date: widget.todayDate,
                                  isActivityTodayExist:
                                      widget.trainingPlan!.isEmpty
                                          ? false
                                          : widget.trainingPlan!.indexWhere(
                                                      (element) =>
                                                          element.dayOfWeek ==
                                                          weekDayNow) !=
                                                  -1
                                              ? true
                                              : false,
                                ),
                                InfoAboutTodayButton(
                                    isPlanLoading: widget.isPlanLoading,
                                    trainingPlan: widget.trainingPlan,
                                    weekDayNow: weekDayNow)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenPad, right: screenPad, top: 20),
                          child: ProgressTempWeekNew(
                            trainings: progressList.value!,
                          ),
                        ),
                      ],
                    ),
            ),
            progressList.isLoading
                ? const SizedBox()
                : PageIndicatorHomeScreen(pageDotController: pageDotController),
          ],
        ),
      ),
    );
  }
}
