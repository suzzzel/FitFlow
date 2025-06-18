import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/select_weekday_to_train/components/first_text_select_weekday.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/select_weekday_to_train/components/row_of_weekday.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/select_weekday_to_train/components/second_text_select_weekday.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/select_weekday_to_train/components/select_weekday_next_step_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/select_way_of_creating_train_plan/custom_plan_way/select_weekday_to_train/components/weekday_list_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Set<WidgetState> interactiveStates = <WidgetState>{
  WidgetState.disabled,
  WidgetState.selected,
};

class SelectWeekdayToTrainWidget extends ConsumerWidget {
  const SelectWeekdayToTrainWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDaySelectProvider = ref.watch(selectWeekdayCustomPlanProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const FirstTextSelectWeekday(),
                WeekdayListBackground(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RowOfWeekdayCustomPlanSelect(
                          weekDaySelectProvider: weekDaySelectProvider,
                          lengthOfRow: 3,
                          weekdayToStart: 0),
                      RowOfWeekdayCustomPlanSelect(
                          weekDaySelectProvider: weekDaySelectProvider,
                          lengthOfRow: 3,
                          weekdayToStart: 3),
                      RowOfWeekdayCustomPlanSelect(
                        weekDaySelectProvider: weekDaySelectProvider,
                        lengthOfRow: 1,
                        weekdayToStart: 6,
                      )
                    ],
                  ),
                ),
                const SecondTextSelectWeekday()
              ],
            ),
          ),
        ),
        const SelectWeekdayNextStepButton()
      ],
    );
  }
}
