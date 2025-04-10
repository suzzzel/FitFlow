import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/general_providers/doc_provider.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDonePlanMainWidget extends ConsumerWidget {
  final bool isThisReadyPlanOrCustom;
  final List<ReadyTrainingPlanModel> listOfDays;
  const ViewDonePlanMainWidget(
      {super.key,
      required this.isThisReadyPlanOrCustom,
      required this.listOfDays});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    final exFolderPath = '${dir.value!.path}/exGifs';
    return Stack(alignment: Alignment.center, children: [
      dir.when(
          data: (readyPlans) {
            if (dir.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.125),

                // Рисуем отдельно ДЕНЬ в тренировочном плане
                child: Padding(
                  padding: const EdgeInsets.only(left: 33, right: 33),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 61),
                    itemCount: listOfDays.length,
                    itemBuilder: (context, index) {
                      final thisDay = listOfDays[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
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
                                  _ruWeekday(listOfDays[index].weekday),
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                          Container(
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
                              child: Center(
                                child: SizedBox(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 30,
                                                mainAxisSpacing: 2.5,
                                                mainAxisExtent: 105,
                                                childAspectRatio: 1),
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Center(
                                            child: getEx(
                                                index: index, thisDay: thisDay),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      );
                    },
                  ),
                ),
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
      return 'Понедельник';
    case 'tuesday':
      return 'Вторник';
    case 'wednesday':
      return 'Среда';
    case 'thursday':
      return 'Четверг';
    case 'friday':
      return 'Пятница';
    case 'saturday':
      return 'Суббота';
    case 'sunday':
      return 'Воскресенье';
    default:
      return '';
  }
}

Widget getEx({required int index, required ReadyTrainingPlanModel thisDay}) {
  late bool isExExist;
  late Widget ex;
  log(thisDay.exOne);
  switch (index) {
    case 0:
      isExExist = true;
      ex = Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        color: Colors.red,
        child: Text(thisDay.exOne),
      );
    case 1:
      isExExist = thisDay.exTwo?.isNotEmpty ?? false;
      if (isExExist) {
        ex = Container(
          height: 50,
          width: 50,
          color: Colors.red,
          child: Text(thisDay.exTwo!),
        );
      } else {
        ex = Container();
      }
    case 2:
      isExExist = thisDay.exThree?.isNotEmpty ?? false;
      if (isExExist) {
        ex = Container(
          height: 50,
          width: 50,
          color: Colors.red,
          child: Text(thisDay.exThree!),
        );
      } else {
        ex = Container();
      }
    case 3:
      isExExist = thisDay.exFour?.isNotEmpty ?? false;
      if (isExExist) {
        ex = Container(
          height: 50,
          width: 50,
          color: Colors.red,
          child: Text(thisDay.exFour!),
        );
      } else {
        ex = Container();
      }
    case 4:
      isExExist = thisDay.exFive?.isNotEmpty ?? false;
      if (isExExist) {
        ex = Container(
          height: 50,
          width: 50,
          color: Colors.red,
          child: Text(thisDay.exFive!),
        );
      } else {
        ex = Container(
          height: 50,
          width: 50,
          color: Colors.amber,
        );
      }
  }
  return ex;
}
