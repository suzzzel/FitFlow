import 'package:fitflow/features/auth/auth_reset_password/domain/models/reset_pass_enums.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_new_pass.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_new_pass_controller.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/snackbars/check_valid_password_snackbar.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/snackbars/network_error_reset_pass_snacknar.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/snackbars/not_correct_password_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterEnterNewPassoword extends ConsumerWidget {
  const NextStepAfterEnterNewPassoword({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVaild = ref.watch(isValidNewPasswordResetPasswordProvider);
    final passRepeatValid =
        ref.watch(isValidpasswordRepeatResetPasswordProvider);
    final passImput = ref.watch(newPasswordResetPasswordProvider);
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
                  // if (!valid) {
                  //   // ignore: use_build_context_synchronously
                  //   showNotValidPasswordResetPasswordError(context);
                  // }
                  switch (valid) {
                    case UpdatePasswordStatus.sucess:
                      break;
                    case UpdatePasswordStatus.networkError:
                      // ignore: use_build_context_synchronously
                      showNetworkError(context);
                    case UpdatePasswordStatus.failure:
                      // ignore: use_build_context_synchronously
                      showNotValidPasswordResetPasswordError(context);
                  }
                }
              : () {
                  showCheckValidPass(context);
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
