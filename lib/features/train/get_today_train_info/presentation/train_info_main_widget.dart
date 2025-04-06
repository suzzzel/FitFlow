import 'package:fitflow/features/train/get_today_train_info/presentation/chill_day_info/chill_day_info.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/empty_train_plan_info/empty_train_plan_info.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/train_day_train_today_info/train_day_info_train_exist.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:flutter/material.dart';

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
                  ? const EmptyTrainPlanInfo()
                  : trainingPlan!.indexWhere(
                              (element) => element.dayOfWeek == weekDayNow) !=
                          -1
                      ? TrainDayInfoTrainToday(
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
    List newList = [
      'clear',
      'clear',
      'clear',
      'clear',
      'clear',
      'clear',
      'clear',
    ];
    for (var x in trainingPlan!) {
      switch (x.dayOfWeek) {
        case 'monday':
          newList.insert(0, x.dayOfWeek);
          break;
        case 'tuesday':
          newList.insert(1, x.dayOfWeek);
          break;
        case 'wednesday':
          newList.insert(2, x.dayOfWeek);
          break;
        case 'thursday':
          newList.insert(3, x.dayOfWeek);
          break;
        case 'friday':
          newList.insert(4, x.dayOfWeek);
          break;
        case 'saturday':
          newList.insert(5, x.dayOfWeek);
          break;
        case 'sunday':
          newList.insert(6, x.dayOfWeek);
          break;
      }
    }
    newList.removeWhere((item) => item == 'clear');
    return newList.indexWhere((item) => weekday == item) + 1;
  }
}
