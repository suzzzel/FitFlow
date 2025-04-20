import 'dart:io';
import 'dart:math';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/get_info_exercises_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/controllers/confrim_ready_plan_controller.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/view_done_plan_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDonePlanMainWidgetNew extends ConsumerWidget {
  final bool isPlanBeenChanged;
  final List<ReadyTrainingPlanModel>? listOfDaysReadyPlan;

  const ViewDonePlanMainWidgetNew({
    super.key,
    required this.isPlanBeenChanged,
    this.listOfDaysReadyPlan,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonAddedPlanState = ref.watch(confrimReadyPlanControllerProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    AsyncValue<List<ExerciseModel>>? exercisesReadyPlan = ref.watch(
        getInfoExercisesReadyPlanDataProvider(
            listOfDaysReadyPlan?.first.idTrain.toString() ?? ''));
    final tempTrainProv = ref.watch(tempTrainPlanProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        dir.when(
          data: (readyPlans) {
            if (!isPlanBeenChanged) {
              return exercisesReadyPlan!.when(
                data: (exercises) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _updateTempPlainProvider(
                        ref: ref,
                        exercises: exercises,
                        listOfDaysReadyPlan: listOfDaysReadyPlan!);
                  });
                  return ReadyPlanExercisesNeedDecomposite(
                    listOfDaysReadyPlan: listOfDaysReadyPlan!,
                    buttonAddedPlanState: buttonAddedPlanState,
                    dir: dir,
                    exercises: exercises,
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 33, right: 33),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tempTrainProv.exercisesByWeekday.length + 1,
                  itemBuilder: (context, index) {
                    // Кнопка сохранения плана после ListView
                    if (index == tempTrainProv.exercisesByWeekday.length) {
                      return _buildSaveButton(
                          context, ref, buttonAddedPlanState);
                    }
                    final weekday =
                        tempTrainProv.exercisesByWeekday.keys.elementAt(index);
                    return _buildDayItem(
                      weekday: weekday,
                      exercises: tempTrainProv.exercisesByWeekday[weekday]!,
                      dir: dir.value!,
                      context: context,
                      dayExerciseIds: tempTrainProv.exercisesByWeekday[weekday]!
                          .map((e) => e.id.toString())
                          .toList(),
                    );
                  },
                ),
              );
            }
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
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
    required List<String?> dayExercises,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required String weekday,
    required BuildContext context,
  }) {
    final firstRow = dayExercises.take(3).toList();
    final secondRow = dayExercises.skip(3).take(2).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 58),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _exercisesRow(
            dayExercises: firstRow,
            exercises: exercises,
            dir: dir,
            context: context,
          ),
          if (secondRow.isNotEmpty) const SizedBox(height: 15),
          if (secondRow.isNotEmpty)
            _exercisesRow(
              dayExercises: secondRow,
              exercises: exercises,
              dir: dir,
              context: context,
            ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('editdayinplan', extra: {
                'weekday': weekday,
                'isPlanBeenChanged': true,
              });
            },
            child: const Text('Изменить'),
          ),
        ],
      ),
    );
  }

  Widget _buildDayItem({
    required String weekday,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required BuildContext context,
    required List<String?> dayExerciseIds,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: Text(
              _ruWeekday(weekday),
              style:
                  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.1),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.1),
              ],
            ),
          ),
          child: Center(
            child: _buildDayExercises(
              dayExercises: dayExerciseIds,
              exercises: exercises,
              dir: dir,
              weekday: weekday,
              context: context,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(
      BuildContext context, WidgetRef ref, AsyncValue buttonAddedPlanState) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 32, bottom: 54),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: () async {
              final tempTrainPlan = ref.read(tempTrainPlanProvider);
              final addedPlan = await ref
                  .read(confrimReadyPlanControllerProvider.notifier)
                  .confirmReadyPlan(days: tempTrainPlan.exercisesByWeekday);
              if (addedPlan) {
                // ignore: use_build_context_synchronously
                context.goNamed('/home');
              }
            },
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: !buttonAddedPlanState.isLoading
                ? FittedBox(
                    child: Text(
                      'Продолжить',
                      textScaler: const TextScaler.linear(1),
                      style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                : const CircularProgressIndicator()),
      ),
    );
  }

  Widget _exercisesRow(
      {required List<String?> dayExercises,
      required List<ExerciseModel> exercises,
      required Directory dir,
      required BuildContext context}) {
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => LinearGradient(colors: [
                          Theme.of(context)
                              .colorScheme
                              .primaryFixed
                              .withOpacity(0.4),
                          Theme.of(context)
                              .colorScheme
                              .secondaryFixed
                              .withOpacity(0.4),
                        ]).createShader(bounds),
                        child: Image.file(
                          exGifFile,
                          width: 65,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 91,
                child: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryFixed,
                    Theme.of(context).colorScheme.secondaryFixed,
                  ]).createShader(bounds),
                  child: Text(
                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    exName,
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      }).toList(),
    );
  }

  void _updateTempPlainProvider(
      {required WidgetRef ref,
      required List<ExerciseModel> exercises,
      required List<ReadyTrainingPlanModel> listOfDaysReadyPlan}) {
    final tempPlanNotifier = ref.read(tempTrainPlanProvider.notifier);
    // Очищаем предыдущие данные
    tempPlanNotifier.reset();

    for (final day in listOfDaysReadyPlan) {
      final dayExercises = [
        day.exOne,
        day.exTwo,
        day.exThree,
        day.exFour,
        day.exFive
      ];

      for (var exId in dayExercises) {
        if (exId != null) {
          final exercise = exercises.firstWhere(
            (ex) => ex.id.toString() == exId,
            orElse: () => throw Exception('Exercise $exId not found'),
          );
          tempPlanNotifier.addExercise(
            weekday: day.weekday,
            exercise: exercise,
          );
        }
      }
    }
  }
}
