import 'dart:developer';

import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_code_to_reset_password_controller.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_new_pass_controller.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/send_reset_pass_code_controller.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/snackbars/network_error.dart';
import 'package:fitflow/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterEnterNewPassoword extends ConsumerWidget {
  const NextStepAfterEnterNewPassoword({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVaild = ref.watch(isValidpasswordSignUpProvider);
    final passRepeatValid = ref.watch(isValidpasswordRepeatSignUpProvider);
    final passImput = ref.watch(passwordSignUpProvider);
    final state = ref.watch(updatePassControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: passwordVaild == true && passRepeatValid == true
              ? () async {
                  final valid = await ref
                      .read(updatePassControllerProvider.notifier)
                      .updatePass(newPassword: passImput);
                  if (!valid) {
                    showNetworkError(context);
                  }
                }
              : () {
                  log('not valid');
                },
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 70)),
              backgroundColor: WidgetStatePropertyAll(
                passwordVaild == true && passRepeatValid == true
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
              )),
          child: FittedBox(
            child: state.isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSecondary)
                : Text(
                    'Продолжить',
                    textScaler: const TextScaler.linear(1),
                    style: GoogleFonts.inter(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
          )),
    );
  }
}
