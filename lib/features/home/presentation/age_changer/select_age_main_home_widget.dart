import 'package:fitflow/features/auth/auth_sign_up/presentation/components/weight_age_selector.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/age/age_second_text.dart';
import 'package:fitflow/features/home/home_main_screen/presentation/age_changer/next_step_after_age_home_button.dart';
import 'package:fitflow/features/home/presentation/age_changer/age_home_first_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAgeMainHomeWidget extends ConsumerWidget {
  const SelectAgeMainHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Измените ваш возраст',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          const AgeHomeFirstText(),
          WeightAgeSelector(
            weightOrAge: false,
            gender: user.sex!,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: NewButtonTest(
                weightOrAge: false,
              ),
            ),
          ),
          const AgeSecondText()
        ],
      ),
    );
  }
}
