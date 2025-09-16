import 'dart:math';

import 'package:fitflow/features/train/do_the_train/domain/providers/cout_of_reps_in_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/max_weight_on_temp_exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DoTheRepInTrain extends ConsumerWidget {
  final TextEditingController controller;
  final String? tempMaxWeight;
  const DoTheRepInTrain(
      {super.key, required this.controller, this.tempMaxWeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ], transform: const GradientRotation(pi / 2))),
        child: ElevatedButton(
            onPressed: () {
              ref.read(coutOfRepsInTempExerciseProvider.notifier).state++;
              if (controller.text != '') {
                final tempWeight = int.parse(controller.text);
                final tempMaxWeightInprov = int.parse(tempMaxWeight ?? '0');
                if (tempWeight > tempMaxWeightInprov) {
                  ref.read(maxWeightOnTempExerciseProvider.notifier).state =
                      controller.text;
                }
              }
              controller.clear();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 50)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: Text(
              'Сделать подход',
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}
