import 'dart:developer';

import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExitTheTrainButton extends ConsumerWidget {
  const ExitTheTrainButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                trainNotifier.tempExercise > 1
                    ? 'really want to exit? all done exercises will be saved. this train will be saved, and cannot be edit'
                    : 'really want to exit? this train will not be saved, you can start it today later'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: trainNotifier.tempExercise > 1
                        ? () {
                            ref
                                .read(completeTrainProvider)
                                .completeTrain(train: trainNotifier);
                            context.goNamed('/home');
                          }
                        : () {
                            context.goNamed('/home');
                            ref.invalidate(tempTrainStateNotifierProvider);
                          },
                    child: Text('yes')),
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('no'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
