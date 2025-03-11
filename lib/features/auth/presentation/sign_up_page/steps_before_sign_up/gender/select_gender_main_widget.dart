import 'package:fitflow/features/auth/auth_sign_up/presentation/gender/next_step_after_gender_button.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/gender/select_gender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectGenderMainWidget extends ConsumerWidget {
  const SelectGenderMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NextStepAfterGenderButton(),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SelectGenderButton(
                gender: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.083,
              ),
              const SelectGenderButton(
                gender: false,
              )
            ],
          ),
        ),
      ],
    );
  }
}
