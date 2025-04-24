import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/ru_week_day_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          alignment: const Alignment(0, -0.7),
          child: RuWeekdayTrainPlan(
            weekday: weekday,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
          child: ListView.builder(
            itemCount: tempTrainProv.exercisesByWeekday[weekday]!.length + 1,
            padding: const EdgeInsets.only(top: 15),
            itemBuilder: (context, index) {
              final exercises = tempTrainProv.exercisesByWeekday[weekday];
              if (exercises!.length - 1 < index && index < 5) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),
                  child: DottedBorder(
                    dashPattern: const [5, 3, 5, 3],
                    color: Theme.of(context).colorScheme.primary,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    strokeWidth: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: FittedBox(
                          child: IconButton(
                              onPressed: () {
                                ref
                                    .read(tempTrainPlanProvider.notifier)
                                    .addExercise(
                                        weekday: weekday,
                                        exercise: ExerciseModel(
                                            id: 9,
                                            bodyPart: 'талия',
                                            equipment: 'медицинский мяч',
                                            name: 'скручивания с мячом',
                                            target: 'прэсс'));
                              },
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.85),
                              icon: const Icon(Icons.add_circle_outline)),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (index == 5) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: SizedBox(
                    height: 65,
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) => LinearGradient(colors: [
                        Theme.of(context).colorScheme.primaryFixed,
                        Theme.of(context).colorScheme.secondaryFixed
                      ]).createShader(bounds),
                      child: const Text(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          'Согласно текущим исследованиям, пять упражнений достаточно для того, что бы дать необхдимую нагрузку организму.'),
                    ),
                  ),
                );
              } else {
                final exName =
                    exercises[index].name.substring(0, 1).toUpperCase() +
                        exercises[index].name.substring(1);
                final exIdGif = exercises[index].id.toString().padLeft(4, '0');
                final exGifFile = File('$exGifFolderPath/$exIdGif.gif');
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                              shaderCallback: (bounds) =>
                                  LinearGradient(colors: [
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            textAlign: TextAlign.center,
                            exName,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 17,
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Theme.of(context)
                                    .colorScheme
                                    .primaryFixed
                                    .withOpacity(0.7),
                                Theme.of(context)
                                    .colorScheme
                                    .secondaryFixed
                                    .withOpacity(0.7),
                              ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: FittedBox(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white.withOpacity(0.85),
                                )),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 17,
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.7),
                                Theme.of(context)
                                    .colorScheme
                                    .errorContainer
                                    .withOpacity(0.7),
                              ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: FittedBox(
                            child: IconButton(
                                onPressed: () {
                                  ref
                                      .read(tempTrainPlanProvider.notifier)
                                      .deleteExercise(
                                          weekday: weekday,
                                          exercise: exercises[index]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red.withOpacity(0.85),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
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