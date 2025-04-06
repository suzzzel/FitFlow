import 'package:fitflow/features/auth/auth_sign_up/presentation/height/height_selector.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/height/height_first_text.dart';
import 'package:fitflow/features/home/future_profile/presentation/height_changer/next_step_after_height_home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeHeightMainHomeWidget extends ConsumerWidget {
  const ChangeHeightMainHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
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
            'Измените ваш рост',
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
          const HeightFirstText(),
          HeightSelector(
            initialChange: user.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 127),
            child: Align(
              alignment: const Alignment(0, 0.06),
              child: Container(
                height: 5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 127),
            child: Align(
              alignment: const Alignment(0, 0.285),
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
              child: NextStepAfterHeightHomeButton(),
            ),
          ),
        ],
      ),
    );
  }
}
