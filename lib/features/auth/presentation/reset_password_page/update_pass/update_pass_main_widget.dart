import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_new_pass.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/next_step_after_enter_new_passoword.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/update_pass/update_pass_imput.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/update_pass/update_pass_repeat_imput.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePassMainWidget extends ConsumerStatefulWidget {
  final String email;
  const UpdatePassMainWidget({super.key, required this.email});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdatePassMainWidgetState();
}

class _UpdatePassMainWidgetState extends ConsumerState<UpdatePassMainWidget> {
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isValidPasswordProv =
        ref.watch(isValidNewPasswordResetPasswordProvider);
    final isValidPasswordRepeatProv =
        ref.watch(isValidpasswordRepeatResetPasswordProvider);
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Align(
          alignment: const Alignment(0, -0.17),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpdatePassImput(
                  passwordController: passwordController,
                  isValidPassword: isValidPasswordProv),
              const SizedBox(
                height: 15,
              ),
              UpdatePassRepeatImput(
                  isValidRepeatPassword: isValidPasswordRepeatProv,
                  passwordRepeatController: passwordRepeatController),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NewNextStepAfterEnterNewPassword(),
          ),
        ),
      ],
    );
  }
}
