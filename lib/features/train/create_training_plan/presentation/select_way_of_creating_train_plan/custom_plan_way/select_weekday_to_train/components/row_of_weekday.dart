import 'package:fitflow/features/train/create_training_plan/domain/models/weekday_for_creating_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class RowOfWeekdayCustomPlanSelect extends ConsumerWidget {
  const RowOfWeekdayCustomPlanSelect(
      {super.key,
      required this.weekDaySelectProvider,
      required this.weekdayToStart,
      required this.lengthOfRow});

  final List<String> weekDaySelectProvider;
  final int weekdayToStart;
  final int lengthOfRow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(lengthOfRow, (int index) {
        return Column(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.primaryFixed,
                        Theme.of(context).colorScheme.secondaryFixed,
                      ])),
              child: Center(
                  child: Text(
                      ruWeekdayForCustomPlan.sublist(weekdayToStart)[index],
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white))),
            ),
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                  side: const BorderSide(color: Colors.transparent),
                  fillColor: WidgetStateProperty.resolveWith(getColor),
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  value: weekDaySelectProvider.contains(
                      weekdayForCustomPlan.sublist(weekdayToStart)[index]),
                  onChanged: (value) {
                    if (value != true) {
                      ref
                          .read(selectWeekdayCustomPlanProvider.notifier)
                          .removeWeekday(weekdayForCustomPlan
                              .sublist(weekdayToStart)[index]);
                    } else {
                      ref
                          .read(selectWeekdayCustomPlanProvider.notifier)
                          .addWeekday(weekdayForCustomPlan
                              .sublist(weekdayToStart)[index]);
                    }
                  }),
            )
          ],
        );
      }),
    );
  }
}

Color getColor(Set<WidgetState> states) {
  const Set<WidgetState> interactiveStates = <WidgetState>{
    WidgetState.selected,
    WidgetState.disabled,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.white;
}
