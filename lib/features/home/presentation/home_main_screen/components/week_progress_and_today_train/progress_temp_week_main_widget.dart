import 'dart:developer';

import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_for_domain.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProgressTempWeekNew extends StatelessWidget {
  final List<TrainingDayForDomain> trainings;
  const ProgressTempWeekNew({super.key, required this.trainings});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(42, 44, 56, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 24, top: 11),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ..._progressTempWeek(trainings, context),
        ]),
      ),
    );
  }

  List<Widget> _progressTempWeek(
      List<TrainingDayForDomain> tempProgress, BuildContext context) {
    final List<Widget> thisWeek = [];
    String tempDay = '';
    for (int x = 0; x != 7; x++) {
      switch (x) {
        case 0:
          tempDay = 'Пн';
          break;
        case 1:
          tempDay = 'Вт';
          break;
        case 2:
          tempDay = 'Ср';
          break;
        case 3:
          tempDay = 'Чт';
          break;
        case 4:
          tempDay = 'Пт';
          break;
        case 5:
          tempDay = 'Сб';
          break;
        case 6:
          tempDay = 'Вс';
          break;
      }
      if (tempProgress.length > x) {
        log(tempProgress[x].percentOfTrainDone.toString());
      }
      thisWeek.add(Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 30,
                height: 154,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(22, 24, 24, 1)),
              ),
              tempProgress.isNotEmpty
                  ? tempProgress.length > x
                      ? Container(
                          width: 30,
                          height: tempProgress[x].percentOfTrainDone == 0
                              ? 154
                              : 154 / 100 * tempProgress[x].percentOfTrainDone,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                stops: tempProgress[x].percentOfTrainDone > 0 &&
                                        !tempProgress[x].isChillDay
                                    ? [0, 100]
                                    : [0.67, 1],
                                colors: tempProgress[x].isChillDay
                                    ? [
                                        Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer,
                                        Theme.of(context).colorScheme.tertiary,
                                      ]
                                    : tempProgress[x].percentOfTrainDone > 70
                                        ? [
                                            Theme.of(context)
                                                .colorScheme
                                                .secondaryFixed,
                                            Theme.of(context)
                                                .colorScheme
                                                .primaryFixed,
                                          ]
                                        : tempProgress[x].percentOfTrainDone !=
                                                0
                                            ? [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .tertiaryFixedDim,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .tertiaryFixed,
                                              ]
                                            : [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .errorContainer,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                              ]),
                          ),
                        )
                      : const SizedBox()
                  : Container(
                      width: 30,
                      height: 154,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Theme.of(context)
                              .colorScheme
                              .secondaryFixed
                              .withOpacity(0.1),
                          Theme.of(context)
                              .colorScheme
                              .primaryFixed
                              .withOpacity(0.1),
                        ]),
                      ),
                    )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FittedBox(
              child: Text(
                tempDay,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ));
    }
    return thisWeek;
  }
}
