import 'dart:developer';

import 'package:fitflow/features/train/create_training_plan/domain/models/weekday_for_creating_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SelectWeekdayToTrainWidget extends ConsumerWidget {
  const SelectWeekdayToTrainWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDaySelectProvider = ref.watch(selectWeekdayCustomPlanProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (int index) {
            return SizedBox(
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                    child: Center(child: Text(ruWeekdayForCustomPlan[index])),
                  ),
                  Checkbox(
                      value: weekDaySelectProvider
                          .contains(weekdayForCustomPlan[index]),
                      onChanged: (value) {
                        if (value != true) {
                          ref
                              .read(selectWeekdayCustomPlanProvider.notifier)
                              .removeWeekday(weekdayForCustomPlan[index]);
                        } else {
                          ref
                              .read(selectWeekdayCustomPlanProvider.notifier)
                              .addWeekday(weekdayForCustomPlan[index]);
                        }
                      })
                ],
              ),
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (int index) {
            return SizedBox(
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                    child: Center(
                        child: Text(ruWeekdayForCustomPlan.sublist(4)[index])),
                  ),
                  Checkbox(
                    value: weekDaySelectProvider
                        .contains(weekdayForCustomPlan.sublist(4)[index]),
                    onChanged: (value) {
                      if (value != true) {
                        ref
                            .read(selectWeekdayCustomPlanProvider.notifier)
                            .removeWeekday(
                                weekdayForCustomPlan.sublist(4)[index]);
                      } else {
                        ref
                            .read(selectWeekdayCustomPlanProvider.notifier)
                            .addWeekday(weekdayForCustomPlan.sublist(4)[index]);
                      }
                    },
                  )
                ],
              ),
            );
          }),
        ),
        ElevatedButton(
            onPressed: () {
              log(weekDaySelectProvider.toString());
              context.goNamed('viewcustomplan');
            },
            child: Text('check'))
      ],
    );
  }
}
