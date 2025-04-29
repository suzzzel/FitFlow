import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 34,
        right: 34,
        top: 10,
      ),
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(colors: [
          Theme.of(context).colorScheme.primaryFixed,
          Theme.of(context).colorScheme.secondaryFixed,
        ]).createShader(bounds),
        child: DottedBorder(
          dashPattern: const [5, 3, 5, 3],
          color: Theme.of(context).colorScheme.primary,
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          strokeWidth: 1,
          child: InkWell(
            onTap: () {
              log('zalupa');
            },
            child: Container(
              height: 103,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                width: 33,
                height: 33,
                child: FittedBox(
                  child: DottedBorder(
                    dashPattern: const [5, 3, 5, 3],
                    borderType: BorderType.Circle,
                    child: IconButton(
                        iconSize: 33,
                        onPressed: () {
                          // ref
                          //     .read(tempTrainPlanProvider.notifier)
                          //     .addExercise(
                          //         weekday: weekday,
                          //         exercise: ExerciseModel(
                          //             id: 9,
                          //             bodyPart: 'талия',
                          //             equipment: 'медицинский мяч',
                          //             name: 'скручивания с мячом',
                          //             target: 'прэсс'));
                          // context.pushNamed(
                          //   'findnewexercisewheneditplan',
                          // );
                          // testSearch.searchExercisesByUserRequest(
                          //     nameOfExercise: 'тяга', numberOfPage: 1);
                        },
                        icon: const Icon(Icons.add)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
