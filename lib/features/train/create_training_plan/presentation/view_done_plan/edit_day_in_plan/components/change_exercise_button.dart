import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangeExercisesInDayButton extends ConsumerWidget {
  final String weekday;
  final ExerciseModel exerciseToDelete;
  const ChangeExercisesInDayButton(
      {super.key, required this.exerciseToDelete, required this.weekday});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Directory> directory = ref.watch(documentsDirectoryProvider);
    return directory.when(
        data: (dir) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 36, maxHeight: 36),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed.withOpacity(0.7),
                  Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.7),
                ]),
                borderRadius: BorderRadius.circular(20)),
            child: FittedBox(
              child: IconButton(
                  onPressed: () {
                    context.pushNamed('findnewexercisewheneditplan', extra: {
                      'dir': dir,
                      'weekday': weekday,
                      'exToDelete': exerciseToDelete
                    });
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white.withOpacity(0.85),
                  )),
            ),
          );
        },
        error: (_, st) => const SizedBox(),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
