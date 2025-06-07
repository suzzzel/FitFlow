import 'dart:developer';

import 'package:fitflow/features/train/create_training_plan/domain/models/weekday_for_creating_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 44),
                  child: Center(
                      child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                    child: Text(
                      'Выберите дни тренировок*',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 33, right: 33),
                  height: 384,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .primaryFixed
                              .withOpacity(0.106),
                          Theme.of(context)
                              .colorScheme
                              .secondaryFixed
                              .withOpacity(0.106),
                        ],
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(3, (int index) {
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
                                          Theme.of(context)
                                              .colorScheme
                                              .primaryFixed,
                                          Theme.of(context)
                                              .colorScheme
                                              .secondaryFixed,
                                        ])),
                                child: Center(
                                    child: Text(ruWeekdayForCustomPlan[index],
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                            color: Colors.white))),
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                    fillColor: WidgetStateProperty.resolveWith(
                                        getColor),
                                    activeColor: Colors.blue,
                                    checkColor: Colors.white,
                                    value: weekDaySelectProvider
                                        .contains(weekdayForCustomPlan[index]),
                                    onChanged: (value) {
                                      if (value != true) {
                                        ref
                                            .read(
                                                selectWeekdayCustomPlanProvider
                                                    .notifier)
                                            .removeWeekday(
                                                weekdayForCustomPlan[index]);
                                      } else {
                                        ref
                                            .read(
                                                selectWeekdayCustomPlanProvider
                                                    .notifier)
                                            .addWeekday(
                                                weekdayForCustomPlan[index]);
                                      }
                                    }),
                              )
                            ],
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(3, (int index) {
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
                                          Theme.of(context)
                                              .colorScheme
                                              .primaryFixed,
                                          Theme.of(context)
                                              .colorScheme
                                              .secondaryFixed,
                                        ])),
                                child: Center(
                                    child: Text(
                                  ruWeekdayForCustomPlan.sublist(3)[index],
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.white),
                                )),
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                  fillColor:
                                      WidgetStateProperty.resolveWith(getColor),
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: weekDaySelectProvider.contains(
                                      weekdayForCustomPlan.sublist(3)[index]),
                                  onChanged: (value) {
                                    if (value != true) {
                                      ref
                                          .read(selectWeekdayCustomPlanProvider
                                              .notifier)
                                          .removeWeekday(weekdayForCustomPlan
                                              .sublist(3)[index]);
                                    } else {
                                      ref
                                          .read(selectWeekdayCustomPlanProvider
                                              .notifier)
                                          .addWeekday(weekdayForCustomPlan
                                              .sublist(3)[index]);
                                    }
                                  },
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(1, (int index) {
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
                                          Theme.of(context)
                                              .colorScheme
                                              .primaryFixed,
                                          Theme.of(context)
                                              .colorScheme
                                              .secondaryFixed,
                                        ])),
                                child: Center(
                                    child: Text(
                                        ruWeekdayForCustomPlan
                                            .sublist(6)[index],
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                            color: Colors.white))),
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                  fillColor:
                                      WidgetStateProperty.resolveWith(getColor),
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: weekDaySelectProvider.contains(
                                      weekdayForCustomPlan.sublist(6)[index]),
                                  onChanged: (value) {
                                    if (value != true) {
                                      ref
                                          .read(selectWeekdayCustomPlanProvider
                                              .notifier)
                                          .removeWeekday(weekdayForCustomPlan
                                              .sublist(6)[index]);
                                    } else {
                                      ref
                                          .read(selectWeekdayCustomPlanProvider
                                              .notifier)
                                          .addWeekday(weekdayForCustomPlan
                                              .sublist(6)[index]);
                                    }
                                  },
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 76),
                  child: Center(
                      child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                    child: Text(
                      textAlign: TextAlign.center,
                      '*рекомендуем не более\n6 дней в неделю',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () {
                log(weekDaySelectProvider.toString());
                context.goNamed('viewcustomplan');
              },
              child: Text('check')),
        )
      ],
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
