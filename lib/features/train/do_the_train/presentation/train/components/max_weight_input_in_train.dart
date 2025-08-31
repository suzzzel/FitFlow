import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/cout_of_reps_in_temp_exercise_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/max_weight_on_temp_exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaxWeightInputInTrain extends ConsumerStatefulWidget {
  final String? tempMaxWeight;
  final TextEditingController controller;
  const MaxWeightInputInTrain(
      {super.key, required this.tempMaxWeight, required this.controller});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MaxWeightInputInTrainState();
}

class _MaxWeightInputInTrainState extends ConsumerState<MaxWeightInputInTrain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
      child: CustomTextField(
          controller: widget.controller,
          labelText: 'Рабочий вес (опционально)',
          onFieldSubmitted: (value) {
            if (value != '') {
              final tempWeight = int.parse(value);
              final tempMaxWeightInprov =
                  int.parse(widget.tempMaxWeight ?? '0');
              if (tempWeight > tempMaxWeightInprov) {
                ref.read(maxWeightOnTempExerciseProvider.notifier).state =
                    value;
                ref.read(coutOfRepsInTempExerciseProvider.notifier).state++;
              } else {
                ref.read(coutOfRepsInTempExerciseProvider.notifier).state++;
              }
            }
            widget.controller.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          obscureText: false,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: false),
          isImputRight: true),
    );
  }
}
