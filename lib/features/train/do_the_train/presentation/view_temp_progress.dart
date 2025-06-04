import 'dart:developer';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/view_progress_temp_train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ViewTempProgressMainWidget extends ConsumerWidget {
  const ViewTempProgressMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    final AsyncValue<List<ExerciseModel>> exercises =
        ref.watch(viewTempProgressTempTrainProvider(trainNotifier));
    final trainExerciesInfo = trainNotifier.getInfoAboutThisTrain();
    log(trainNotifier.getInfoAboutThisTrain().toString());
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                exercises.when(
                    data: (exercises) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: ListView(
                            children: List.generate(
                                exercises.length,
                                (int index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Colors.red,
                                        height: 70,
                                        child: Column(
                                          children: [
                                            Text('${exercises[index].name}'),
                                            trainExerciesInfo['skippedEx']
                                                        ?[index] !=
                                                    'true'
                                                ? const SizedBox()
                                                : const Text(
                                                    'Упражнение было пропущено'),
                                            trainExerciesInfo['countOfRepsByEx']
                                                            ?[index] !=
                                                        'null' &&
                                                    trainExerciesInfo[
                                                                'skippedEx']
                                                            ?[index] !=
                                                        'true'
                                                ? Text(
                                                    'Количество подходов: ${trainExerciesInfo['countOfRepsByEx']?[index]}')
                                                : const Text(
                                                    'Ждем завершения упражнения'),
                                            trainExerciesInfo['maxWeightOnEx']
                                                            ?[index] !=
                                                        null &&
                                                    trainExerciesInfo[
                                                                'skippedEx']
                                                            ?[index] !=
                                                        'true'
                                                ? Text(
                                                    'Максимальный вес в кг: ${trainExerciesInfo['maxWeightOnEx']?[index] ?? 'не был указан'}')
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                    error: (_, st) => Text('error'),
                    loading: () => CircularProgressIndicator()),
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('close'))
              ],
            ),
          )),
    );
  }
}
