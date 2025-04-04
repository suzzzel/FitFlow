import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_providers/doc_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/create_training_plan_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectReadyPlanMainWidget extends ConsumerWidget {
  const SelectReadyPlanMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<int, List<ReadyTrainingPlanModel>>> readyPlans =
        ref.watch(createTrainPlanDomainProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    return Stack(alignment: Alignment.center, children: [
      readyPlans.when(
          data: (readyPlans) {
            if (dir.isLoading) {
              return CircularProgressIndicator();
            } else {
              log(readyPlans.toString());
              return ListView.builder(
                itemBuilder: (context, index) {
                  final exFolderPath = '${dir.value!.path}/exGifs';
                  return Container(
                    height: 200,
                    child: Column(
                      children: [
                        Text(readyPlans[1]!.first.name),
                        Image.asset(
                            width: 100,
                            height: 100,
                            '$exFolderPath/${readyPlans[1]!.first.exGif}.gif'),
                      ],
                    ),
                  );
                },
              );
            }
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator()),
    ]);
  }
}
