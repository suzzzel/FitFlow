import 'dart:io';
import 'dart:math';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/add_another_exercise_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/change_exercise_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/delete_exrcise_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_name.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/max_length_day_exercise_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDayInPlanMainWidget extends ConsumerWidget {
  final String weekday;
  final Directory dir;
  const EditDayInPlanMainWidget(
      {super.key, required this.weekday, required this.dir});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempTrainProv = ref.watch(tempTrainPlanProvider);
    final exGifFolderPath = '${dir.path}/exGifs';
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Align(
          alignment: const Alignment(0, -0.67),
          child: RuWeekdayTrainPlan(
            weekday: weekday,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.2,
              bottom: MediaQuery.of(context).size.height * 0.15),
          child: ListView.builder(
            itemCount: tempTrainProv.exercisesByWeekday[weekday]!.length + 1,
            padding: const EdgeInsets.only(
              top: 1,
            ),
            itemBuilder: (context, index) {
              final exercises = tempTrainProv.exercisesByWeekday[weekday];
              if (exercises!.length - 1 < index && index < 5) {
                return AddExerciseButton(
                  dir: dir,
                );
              } else if (index == 5) {
                return MaxLengthDayExercisesInfo();
              } else {
                final exName =
                    exercises[index].name.substring(0, 1).toUpperCase() +
                        exercises[index].name.substring(1);
                final exIdGif = exercises[index].id.toString().padLeft(4, '0');
                final exGifFile = File('$exGifFolderPath/$exIdGif.gif');
                return ExercisesInDayInfo(
                    exGifFile: exGifFile,
                    lengthOfExercises: exercises.length,
                    exName: exName,
                    weekday: weekday,
                    exercises: exercises[index]);
              }
            },
          ),
        ),
        BackToViewDonePlanButton(),
      ],
    );
  }
}

class BackToViewDonePlanButton extends StatelessWidget {
  const BackToViewDonePlanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 39,
          right: 39,
          bottom: 35,
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(99)),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ], transform: const GradientRotation(pi / 4))),
          child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 60)),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent)),
              child: FittedBox(
                child: Text(
                  'Продолжить',
                  textScaler: const TextScaler.linear(1),
                  style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              )),
        ),
      ),
    );
  }
}

class ExercisesInDayInfo extends ConsumerWidget {
  const ExercisesInDayInfo({
    super.key,
    required this.exGifFile,
    required this.exName,
    required this.weekday,
    required this.exercises,
    required this.lengthOfExercises,
  });

  final File exGifFile;
  final String exName;
  final String weekday;
  final int lengthOfExercises;
  final ExerciseModel exercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34, top: 10),
      child: Container(
        padding:
            const EdgeInsets.only(top: 19, bottom: 19, left: 23, right: 15),
        height: 103,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed.withOpacity(0.1),
              Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.1),
            ])),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExerciseImage(exGifFile: exGifFile),
            ExerciseName(exName: exName),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: lengthOfExercises > 1
                        ? Alignment.topCenter
                        : Alignment.center,
                    child: const ChangeExercisesInDayButton()),
                lengthOfExercises > 1
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: DeleteExercisesInDayButton(
                            weekday: weekday, exercises: exercises),
                      )
                    : const SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}








/*

 ref.read(tempTrainPlanProvider.notifier).addExercise(
                          weekday: weekday,
                          exercise: ExerciseModel(
                              id: 9,
                              bodyPart: 'талия',
                              equipment: 'медицинский мяч',
                              name: 'скручивания с мячом',
                              target: 'прэсс'));

 */