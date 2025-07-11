import 'package:fitflow/features/auth/auth_sign_up/presentation/components/weight_age_selector.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/weight/weight_second_text.dart';
import 'package:fitflow/features/home/future_profile/presentation/indicators_view/next_step_after_age_weight_home_button.dart';
import 'package:fitflow/features/home/future_profile/presentation/indicators_view/weight_changer/weight_home_first_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeWeightMainHomeWidget extends ConsumerWidget {
  const ChangeWeightMainHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    return Stack(
      children: [
        const WeightHomeFirstText(),
        WeightAgeSelector(
          weightOrAge: true,
          gender: user.sex!,
          initialChange: user.weight! - 35,
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NextStepAfterAgeWeightHomeButton(
              weightOrAge: true,
            ),
          ),
        ),
        const WeightSecondText()
      ],
    );
  }
}
