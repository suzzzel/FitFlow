import 'package:fitflow/features/auth/auth_sign_up/presentation/goal/goal_selector.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/goal/next_step_after_goal_select_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/goal/goal_first_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectGoalMainWidget extends ConsumerWidget {
  const SelectGoalMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Какая у вас цель?',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const GoalFirstText(),
          const GoalSelector(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 122),
            child: Align(
              alignment: const Alignment(0, 0.06),
              child: Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 122),
            child: Align(
              alignment: const Alignment(0, 0.23),
              child: Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: NextStepAfterGoalSelectButton(),
            ),
          ),
        ],
      ),
    );
  }
}
