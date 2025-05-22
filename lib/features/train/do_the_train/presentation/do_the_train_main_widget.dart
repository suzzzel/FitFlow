import 'dart:developer';

import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoTheTrainMainWidget extends ConsumerStatefulWidget {
  const DoTheTrainMainWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DoTheTrainMainWidgetState();
}

class _DoTheTrainMainWidgetState extends ConsumerState<DoTheTrainMainWidget> {
  @override
  Widget build(BuildContext context) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    return Center(
      child: Container(
        child: ElevatedButton(
            onPressed: () {
              log(trainNotifier.toString());
              // ref
              //     .read(tempTrainStateNotifierProvider.notifier)
              //     .skipExercise(tempExercise: trainNotifier.tempExercise);
            },
            child: Text('press')),
      ),
    );
  }
}
