import 'package:fitflow/features/home/presentation/home_main_screen/today_info/chill_day_info.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/today_info/train_day_info_train_exist.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingPlanMainWidget extends StatelessWidget {
  final DateTime timeNow;
  final String weekDayNow;
  final List<TrainingPlanClass>? trainingPlan;
  final bool isPlanLoading;
  const TrainingPlanMainWidget(
      {super.key,
      required this.isPlanLoading,
      required this.trainingPlan,
      required this.timeNow,
      required this.weekDayNow});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 26, left: 37, right: 29, bottom: 52),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryFixed.withOpacity(0.1),
                    Theme.of(context)
                        .colorScheme
                        .secondaryFixed
                        .withOpacity(0.1),
                  ])),
          height: 116,
          child: isPlanLoading
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                )
              : trainingPlan!.isEmpty
                  ? ElevatedButton(
                      onPressed: () {
                        context.goNamed('newtrainplan');
                      },
                      child: const Text('create button'))
                  : trainingPlan!.indexWhere(
                              (element) => element.dayOfWeek == weekDayNow) !=
                          -1
                      ? TrainDayInfoTrainExist(
                          train: trainingPlan![trainingPlan!.indexWhere(
                              (element) => element.dayOfWeek == weekDayNow)],
                          numberOfWeek: timeNow
                                          .difference(DateTime.parse(
                                              trainingPlan!
                                                  .first.dataCreatingPlan))
                                          .inDays /
                                      7 <=
                                  0
                              ? 1
                              : timeNow
                                          .difference(DateTime.parse(
                                              trainingPlan!
                                                  .first.dataCreatingPlan))
                                          .inDays ~/
                                      7 +
                                  1,
                          numberOfDayTrain: _getWeekDay(
                            trainingPlan!
                                .firstWhere(
                                    (train) => train.dayOfWeek == weekDayNow)
                                .dayOfWeek,
                          ),
                          countTrainInWeek: trainingPlan!.length,
                        )
                      : ChillDayInfo(
                          numberOfWeek: timeNow
                                          .difference(DateTime.parse(
                                              trainingPlan!
                                                  .first.dataCreatingPlan))
                                          .inDays /
                                      7 <=
                                  0
                              ? 1
                              : timeNow
                                          .difference(DateTime.parse(
                                              trainingPlan!
                                                  .first.dataCreatingPlan))
                                          .inDays ~/
                                      7 +
                                  1,
                        ),
        ));
  }

  int _getWeekDay(String weekday) {
    switch (weekday) {
      case 'monday':
        return 1;
      case 'tuesday':
        return 2;
      case 'wednesday':
        return 3;
      case 'thursday':
        return 4;
      case 'friday':
        return 5;
      case 'saturday':
        return 6;
      case 'sunday':
        return 7;
      default:
        return 0;
    }
  }
}
