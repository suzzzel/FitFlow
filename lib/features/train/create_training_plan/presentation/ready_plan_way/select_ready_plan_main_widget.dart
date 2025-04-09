import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_providers/doc_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/create_training_plan_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
              return const CircularProgressIndicator();
            } else {
              log(readyPlans.toString());
              return ListView.builder(
                itemCount: readyPlans.length,
                itemBuilder: (context, index) {
                  // ignore: unused_local_variable
                  final exFolderPath = '${dir.value!.path}/exGifs';
                  final trueIndex = index + 1;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 33, right: 33, bottom: 22),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryFixed
                                      .withOpacity(0.1),
                                  Theme.of(context)
                                      .colorScheme
                                      .secondaryFixed
                                      .withOpacity(0.1),
                                ])),
                        height: 146,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 19, top: 15, right: 10),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.168,
                                        child: FittedBox(
                                          child: Image.asset(
                                              'assets/create_training_plan/ready_plan.png'),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 7,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 12),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: ShaderMask(
                                                blendMode: BlendMode.srcATop,
                                                shaderCallback: (bounds) =>
                                                    LinearGradient(colors: [
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .primaryFixed,
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .secondaryFixed,
                                                ]).createShader(bounds),
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    readyPlans[trueIndex]!
                                                        .first
                                                        .name,
                                                    textAlign: TextAlign.center,
                                                    textScaler:
                                                        const TextScaler.linear(
                                                            1),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 190,
                                              child: Center(
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: _getWeekDay(
                                                        readyPlans[trueIndex]!
                                                            .length,
                                                        readyPlans[trueIndex]!,
                                                        context)),
                                              )

                                              // (context, index) => Text(
                                              //     readyPlans[trueIndex]![index].weekday)

                                              ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: SizedBox(
                                              child: ShaderMask(
                                                blendMode: BlendMode.srcATop,
                                                shaderCallback: (bounds) =>
                                                    LinearGradient(colors: [
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .primaryFixed,
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .secondaryFixed,
                                                ]).createShader(bounds),
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    'Сложность: ${_getDifficultRU(tempDiff: readyPlans[trueIndex]![index].level)}',
                                                    textAlign: TextAlign.center,
                                                    textScaler:
                                                        const TextScaler.linear(
                                                            1),
                                                    style: GoogleFonts.inter(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            child: ShaderMask(
                                              blendMode: BlendMode.srcATop,
                                              shaderCallback: (bounds) =>
                                                  LinearGradient(colors: [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primaryFixed,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondaryFixed,
                                              ]).createShader(bounds),
                                              child: Text(
                                                'Развивает: ${_getGoalRU(goal: readyPlans[trueIndex]![index].goal)}',
                                                textAlign: TextAlign.center,
                                                textScaler:
                                                    const TextScaler.linear(1),
                                                style: GoogleFonts.inter(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
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

String _ruWeekday(String weekday) {
  switch (weekday) {
    case 'monday':
      return 'ПН';
    case 'tuesday':
      return 'ВТ';
    case 'wednesday':
      return 'СР';
    case 'thursday':
      return 'ЧТ';
    case 'friday':
      return 'ПТ';
    case 'saturday':
      return 'СБ';
    case 'sunday':
      return 'ВС';
    default:
      return '';
  }
}

List<Widget> _getWeekDay(int lengthWeekdays,
    List<ReadyTrainingPlanModel> traindays, BuildContext context) {
  final List<Widget> widgets = [];

  for (int i = 0; i != lengthWeekdays; i++) {
    final ruWeekday = _ruWeekday(traindays[i].weekday);
    widgets.add(Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ])),
      width: MediaQuery.of(context).size.width * 0.08,
      height: MediaQuery.of(context).size.height * 0.038,
      child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 3, top: 5, bottom: 3),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                ruWeekday,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ))),
    ));
  }
  return widgets;
}

String _getDifficultRU({required String tempDiff}) {
  switch (tempDiff) {
    case 'skilled':
      return 'Умеренная';
    case 'master':
      return 'Хард';
    case 'beginner':
      return 'Легкая';
    default:
      return '';
  }
}

String _getGoalRU({required String goal}) {
  switch (goal) {
    case 'strength':
      return 'Сила';
    case 'flexibility':
      return 'Гибкость';
    case 'endurance':
      return 'Выносливость';
    default:
      return '';
  }
}
