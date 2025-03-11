import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalSelector extends ConsumerStatefulWidget {
  const GoalSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoalSelectorState();
}

class _GoalSelectorState extends ConsumerState<GoalSelector> {
  final List<String> goals = ['Гибкость', 'Сила', 'Выносливость'];

  @override
  Widget build(BuildContext context) {
    final goalMain = ref.watch(selectGoalProvider.notifier);
    return Align(
      alignment: const Alignment(0, 0.2),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: CarouselSlider(
            items: List<Widget>.generate(3, (int index) {
              return Center(
                child: SizedBox(
                    height: goalMain.state == goals[index]
                        ? MediaQuery.of(context).size.height * 0.07
                        : MediaQuery.of(context).size.height * 0.04,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        goals[index],
                        textAlign: TextAlign.center,
                        textScaler: const TextScaler.linear(1),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: goalMain.state == goals[index] ? 35 : 23,
                            color: goalMain.state == goals[index]
                                ? Colors.white.withOpacity(0.9)
                                : Colors.white.withOpacity(0.7)),
                      ),
                    )),
              );
            }),
            options: CarouselOptions(
              viewportFraction: 0.3,
              pageSnapping: true,
              enableInfiniteScroll: true,
              scrollDirection: Axis.vertical,
              initialPage: goals.indexOf(goalMain.state),
              onPageChanged: (index, reason) {
                setState(() {
                  goalMain.state = goals[index];
                });
              },
            )),
      ),
    );
  }
}
