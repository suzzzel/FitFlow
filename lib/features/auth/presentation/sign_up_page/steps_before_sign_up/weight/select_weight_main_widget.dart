import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/components/weight_age_selector.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/components/next_step_after_weight_age_select_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/weight/weight_first_text.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/weight/weight_second_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectWeightMainWidget extends ConsumerWidget {
  const SelectWeightMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regUser = ref.watch(regUserProvider);
    return Stack(
      children: [
        const WeightFirstText(),
        WeightAgeSelector(
          key: const Key('weight_selector'),
          weightOrAge: true,
          gender: regUser.sex!,
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NextStepAfterWeightAgeSelectButton(
              key: Key('confirm_weight'),
              weightOrAge: true,
            ),
          ),
        ),
        const WeightSecondText()
      ],
    );
  }
}
