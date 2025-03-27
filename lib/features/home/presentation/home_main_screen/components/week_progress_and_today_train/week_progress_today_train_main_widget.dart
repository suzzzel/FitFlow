import 'dart:developer';

import 'package:fitflow/features/home/presentation/home_main_screen/components/today_date_home_screen_text.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/week_progress_and_today_train/chill_day_button.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/week_progress_and_today_train/create_train_plan.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/week_progress_and_today_train/progress_temp_week_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/week_progress_and_today_train/start_train_button.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/providers/get_temp_week_progress_domain_provider.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class WeekProgressTodayTrainMainWidgetNew extends ConsumerStatefulWidget {
//   final String todayDate;
//   const WeekProgressTodayTrainMainWidgetNew(
//       {super.key, required this.todayDate});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _WeekProgressTodayTrainMainWidgetNewState();
// }

// class _WeekProgressTodayTrainMainWidgetNewState
//     extends ConsumerState<WeekProgressTodayTrainMainWidgetNew> {
//   final pageDotController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     final progressList =
//         ref.watch(getTempWeekProgressDomainProviderAsyncProvider);
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 37, right: 29),
//           child: Container(
//             height: 198,
//             decoration: BoxDecoration(
//                 color: const Color.fromRGBO(42, 44, 56, 1),
//                 borderRadius: BorderRadius.circular(20)),
//             child: progressList.isLoading
//                 ? const SizedBox(
//                     height: 50,
//                     child: Center(child: CircularProgressIndicator()))
//                 : PageView(
//                     pageSnapping: true,
//                     controller: pageDotController,
//                     children: [
//                       Container(
//                         color: Colors.white12,
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     height: 118,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.all(0),
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           width: 1.5,
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .secondaryFixed),
//                                       borderRadius: BorderRadius.circular(20)),
//                                   height: 118,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(top: 12),
//                                     child: Column(
//                                       children: [
//                                         SizedBox(
//                                             width: 41,
//                                             height: 15,
//                                             child: FittedBox(
//                                                 child: TodayDateHomeScreenText(
//                                               todayDate: widget.todayDate,
//                                             ))),
//                                         SizedBox(
//                                           height: 91.78,
//                                           child: Image.asset(
//                                             fit: BoxFit.scaleDown,
//                                             'assets/home/graph_today_train.png',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Container(
//                               height: 80,
//                               color: Colors.purple,
//                             )
//                           ],
//                         ),
//                       ),
//                       ProgressTempWeekNew(
//                         trainings: progressList.value!,
//                       )
//                     ],
//                   ),
//           ),
//         ),
//         progressList.isLoading
//             ? const SizedBox()
//             : Padding(
//                 padding: const EdgeInsets.only(bottom: 3),
//                 child: SmoothPageIndicator(
//                   controller: pageDotController,
//                   count: 2,
//                   effect: const WormEffect(
//                       dotHeight: 3, dotWidth: 35, activeDotColor: Colors.white),
//                 ),
//               ),
//       ],
//     );
//   }
// }

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
                  ? const SizedBox(
                      height: 50,
                      child: Center(child: CircularProgressIndicator()))
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 118,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondaryFixed),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              'Пока нет активности\nФИКСИТЬ',
                                              style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondaryFixed),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 118,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              SizedBox(
                                                  width: 41,
                                                  height: 15,
                                                  child: FittedBox(
                                                      child:
                                                          TodayDateHomeScreenText(
                                                    todayDate: widget.todayDate,
                                                  ))),
                                              Align(
                                                  alignment:
                                                      const Alignment(0, 1),
                                                  child: Image.asset(
                                                      fit: BoxFit.contain,
                                                      height: 91.78,
                                                      'assets/home/graph_today_train.png')),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryFixed),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: widget.isPlanLoading
                                        ? const SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          )
                                        : widget.trainingPlan!.isEmpty
                                            ? const CreateTrainPlanButton()
                                            : widget.trainingPlan!.indexWhere(
                                                        (element) =>
                                                            element.dayOfWeek ==
                                                            weekDayNow) !=
                                                    -1
                                                ? const StartTrainButton()
                                                // Перенести на домейн уровень, в верстке не должно быть такой истории
                                                : const ChillDayButton(),
                                  ),
                                )
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
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: pageDotController,
                      count: 2,
                      effect: const WormEffect(
                        dotHeight: 3,
                        dotWidth: 35,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
