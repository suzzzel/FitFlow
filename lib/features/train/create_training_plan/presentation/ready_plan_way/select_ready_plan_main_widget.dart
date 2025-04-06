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
                              left: 19, top: 15, bottom: 16, right: 10),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: FittedBox(
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryFixed
                                                .withOpacity(0.67),
                                            offset: const Offset(0, 4),
                                            blurRadius: 20)
                                      ]),
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
                                          readyPlans[trueIndex]!.first.name,
                                          textAlign: TextAlign.center,
                                          textScaler:
                                              const TextScaler.linear(1),
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 66,
                                  height: 66,
                                  child: FittedBox(
                                    child: Image.asset(
                                        'assets/create_training_plan/ready_plan.png'),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.2, -0.2),
                                child: SizedBox(
                                    height: 30,
                                    width: 180,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: _getWeekDay(
                                            readyPlans[trueIndex]!.length,
                                            readyPlans[trueIndex]!,
                                            context))

                                    // (context, index) => Text(
                                    //     readyPlans[trueIndex]![index].weekday)

                                    ),
                              ),
                              Align(
                                  alignment: const Alignment(0, 0.5),
                                  child: FittedBox(
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryFixed
                                                .withOpacity(0.67),
                                            offset: const Offset(0, 4),
                                            blurRadius: 20)
                                      ]),
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
                                          'Сложность: ${readyPlans[trueIndex]![index].level}',
                                          textAlign: TextAlign.center,
                                          textScaler:
                                              const TextScaler.linear(1),
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FittedBox(
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryFixed
                                                .withOpacity(0.67),
                                            offset: const Offset(0, 4),
                                            blurRadius: 20)
                                      ]),
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
                                          'Развивает: ${readyPlans[trueIndex]![index].goal}',
                                          textAlign: TextAlign.center,
                                          textScaler:
                                              const TextScaler.linear(1),
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )),
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ])),
      width: 30,
      height: 30,
      child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 3, top: 5, bottom: 3),
          child: FittedBox(
              child: Text(
            ruWeekday,
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ))),
    ));
  }
  return widgets;
}
