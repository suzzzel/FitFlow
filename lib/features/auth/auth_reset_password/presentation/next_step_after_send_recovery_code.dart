import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_email_provider.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/send_reset_pass_code_controller.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/snackbars/network_error_reset_pass_snacknar.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/snackbars/not_correct_email_reset_pass_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterSendRecoveryCodeButton extends ConsumerWidget {
  const NextStepAfterSendRecoveryCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailValid = ref.watch(isValidEmailResetPasswordProvider);
    final emailImput = ref.watch(emailResetPasswordProvider);
    final sendCodeProviderState =
        ref.watch(sendResetPassCodeControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: emailValid == true
              ? () async {
                  final codeSended = await ref
                      .read(sendResetPassCodeControllerProvider.notifier)
                      .sendResetCode(email: emailImput);
                  if (codeSended) {
                    // ignore: use_build_context_synchronously
                    context.goNamed('enterrecoverycode', extra: emailImput);
                  } else {
                    // ignore: use_build_context_synchronously
                    showNetworkError(context);
                  }
                }
              : () {
                  showNotValidEmailResetPasswordError(context);
                },
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 70)),
              backgroundColor: WidgetStatePropertyAll(
                emailValid == true
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
              )),
          child: FittedBox(
            child: sendCodeProviderState.isLoading
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
