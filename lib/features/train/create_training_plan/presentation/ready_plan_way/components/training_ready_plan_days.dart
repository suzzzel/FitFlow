import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingReadyPlanDays extends StatelessWidget {
  const TrainingReadyPlanDays({
    super.key,
    required this.trainDays,
    required this.lengthWeekDays,
  });

  final List<ReadyTrainingPlanModel> trainDays;
  final int lengthWeekDays;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 190,
        child: Center(
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _getWeekDay(lengthWeekDays, trainDays, context)),
        ));
  }
}

List<Widget> _getWeekDay(int lengthWeekdays,
    List<ReadyTrainingPlanModel> traindays, BuildContext context) {
  final List<Widget> widgets = [];

  for (int i = 0; i != lengthWeekdays; i++) {
    final ruWeekday = _ruWeekday(traindays[i].weekday);
    widgets.add(Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ])),
      width: 30,
      height: 30,
      child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 3, top: 5, bottom: 3),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                ruWeekday,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ))),
    ));
  }
  return widgets;
}

String _ruWeekday(String weekday) {
  switch (weekday) {
    case 'monday':
      return 'ПН';
    case 'tuesday':
      return 'ВТ';
    case 'wednesday':
      return 'СР';
    case 'thursday':
      return 'ЧТ';
    case 'friday':
      return 'ПТ';
    case 'saturday':
      return 'СБ';
    case 'sunday':
      return 'ВС';
    default:
      return '';
  }
}
