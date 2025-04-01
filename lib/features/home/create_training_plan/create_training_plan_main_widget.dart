import 'package:fitflow/features/home/create_training_plan/domain/providers/select_way_of_creating_train_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectWayOfCreatingTrainPlanMainWidget extends ConsumerStatefulWidget {
  const SelectWayOfCreatingTrainPlanMainWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectWayOfCreatingTrainPlanState();
}

class _SelectWayOfCreatingTrainPlanState
    extends ConsumerState<SelectWayOfCreatingTrainPlanMainWidget> {
  @override
  Widget build(BuildContext context) {
    final wayController = ref.watch(selectWayOfCreatingTrainPlanProvider);
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.13,
        bottom: MediaQuery.of(context).size.height * 0.13,
      ),
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => ref
                  .read(selectWayOfCreatingTrainPlanProvider.notifier)
                  .state = 1,
              child: WayOfCreating(
                readyOrCustom: true,
                tempSelectedWay: wayController,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
                onTap: () => ref
                    .read(selectWayOfCreatingTrainPlanProvider.notifier)
                    .state = 2,
                child: WayOfCreating(
                  readyOrCustom: false,
                  tempSelectedWay: wayController,
                )),
          )
        ],
      ),
    );
  }
}

class WayOfCreating extends StatelessWidget {
  final bool readyOrCustom;
  final int tempSelectedWay;
  const WayOfCreating(
      {super.key, required this.readyOrCustom, required this.tempSelectedWay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.07,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.06,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: FittedBox(
                    child: Image.asset(readyOrCustom
                        ? 'assets/create_training_plan/ready_plan.png'
                        : 'assets/create_training_plan/custom_plan.png'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.055,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                    child: Text(
                      readyOrCustom
                          ? 'Готовые программы\nтренировок'
                          : 'Составьте свою\nпрограмму тренировок',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 28,
            ),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  boxShadow: tempSelectedWay == 1 && readyOrCustom == true ||
                          tempSelectedWay == 2 && readyOrCustom == false
                      ? [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5))
                        ]
                      : [],
                  borderRadius: BorderRadius.circular(19),
                  gradient: LinearGradient(
                      colors: tempSelectedWay == 1 && readyOrCustom == true ||
                              tempSelectedWay == 2 && readyOrCustom == false
                          ? [
                              Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(0.5),
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5)
                            ]
                          : [
                              Theme.of(context)
                                  .colorScheme
                                  .secondaryFixed
                                  .withOpacity(0.5),
                              Theme.of(context)
                                  .colorScheme
                                  .primaryFixed
                                  .withOpacity(0.5)
                            ])),
              child: Center(
                child: SizedBox(
                  width: 268,
                  child: FittedBox(
                    child: Text(
                      readyOrCustom
                          ? 'Подборка упражнений, основанная\nна выборе качеств ранее\nи ваших желаниях'
                          : 'У меня есть готовая программа/\nжелание сделать свой опыт\nболее персональным',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
