import 'dart:io';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/custom_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDayInPlanMainWidget extends StatelessWidget {
  final ReadyTrainingPlanModel? thisDayExReadyPlan;
  final CustomTrainingPlanModel? thisDayExCustomPlan;
  final String dayName;
  final List<ExerciseModel> exercises;
  final Directory dir;
  const EditDayInPlanMainWidget(
      {super.key,
      required this.dayName,
      required this.exercises,
      required this.dir,
      this.thisDayExCustomPlan,
      this.thisDayExReadyPlan});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                child: Text(
                  _ruWeekday(dayName),
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w700),
                )),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primaryFixed
                                .withOpacity(0.1),
                            Theme.of(context)
                                .colorScheme
                                .secondaryFixed
                                .withOpacity(0.1),
                          ])),
                  child: Center(
                    child: _buildDayExercises(
                        exercises: exercises,
                        dir: dir,
                        context: context,
                        thisDayExReadyPlan: thisDayExReadyPlan,
                        thisDayExCustomPlan: thisDayExCustomPlan),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

String _ruWeekday(String weekday) {
  switch (weekday) {
    case 'monday':
      return 'Понедельник';
    case 'tuesday':
      return 'Вторник';
    case 'wednesday':
      return 'Среда';
    case 'thursday':
      return 'Четверг';
    case 'friday':
      return 'Пятница';
    case 'saturday':
      return 'Суббота';
    case 'sunday':
      return 'Воскресенье';
    default:
      return '';
  }
}

Widget _buildDayExercises({
  required List<ExerciseModel> exercises,
  required Directory dir,
  required BuildContext context,
  required ReadyTrainingPlanModel? thisDayExReadyPlan,
  required CustomTrainingPlanModel? thisDayExCustomPlan,
}) {
  List<String?> dayExercises = [];
  if (thisDayExReadyPlan != null) {
    dayExercises.add(thisDayExReadyPlan.exOne);
    dayExercises.add(thisDayExReadyPlan.exTwo);
    dayExercises.add(thisDayExReadyPlan.exThree);
    dayExercises.add(thisDayExReadyPlan.exFour);
    dayExercises.add(thisDayExReadyPlan.exFive);
  } else {
    dayExercises.add(thisDayExCustomPlan!.exOne);
    dayExercises.add(thisDayExCustomPlan.exTwo);
    dayExercises.add(thisDayExCustomPlan.exThree);
    dayExercises.add(thisDayExCustomPlan.exFour);
    dayExercises.add(thisDayExCustomPlan.exFive);
  }
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 58),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _exercisesRow(
            dayExercises: dayExercises.sublist(0, 3),
            exercises: exercises,
            dir: dir,
            context: context),
        const SizedBox(
          height: 15,
        ),
        _exercisesRow(
            dayExercises: dayExercises.sublist(3),
            exercises: exercises,
            dir: dir,
            context: context),
      ],
    ),
  );
}

Widget _exercisesRow({
  required List<String?> dayExercises,
  required List<ExerciseModel> exercises,
  required Directory dir,
  required BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: dayExercises.map((exId) {
      final exGifFolderPath = '${dir.path}/exGifs';
      if (exId != null) {
        final exName =
            exercises.where((ex) => ex.id.toString() == exId).first.name;
        final exIdGif = exId.padLeft(4, '0');
        final exGifFile = File('$exGifFolderPath/$exIdGif.gif');
        return Row(
          children: [
            Image.file(
              exGifFile,
              width: 65,
              height: 65,
            )
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }).toList(),
  );
}
