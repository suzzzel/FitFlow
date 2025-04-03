import 'package:fitflow/features/home/create_training_plan/domain/providers/select_way_of_creating_train_plan.dart';
import 'package:fitflow/features/home/create_training_plan/presentation/select_way_of_creating_train_plan/components/confrim_way_of_creating_button.dart';
import 'package:fitflow/features/home/create_training_plan/presentation/select_way_of_creating_train_plan/components/way_of_creating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectWayOfCreatingTrainPlanMainWidget extends ConsumerWidget {
  const SelectWayOfCreatingTrainPlanMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wayController = ref.watch(selectWayOfCreatingTrainPlanProvider);
    return Stack(
      children: [
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: ConfrimWayOfCreatingButton(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.13,
            bottom: MediaQuery.of(context).size.height * 0.21,
          ),
          child: Column(
            children: [
              Expanded(
                child: WayOfCreatingButton(
                  readyOrCustom: true,
                  tempSelectedWay: wayController,
                ),
              ),
              Expanded(
                child: WayOfCreatingButton(
                  readyOrCustom: false,
                  tempSelectedWay: wayController,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
