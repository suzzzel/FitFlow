import 'dart:developer';

import 'package:fitflow/features/auth/auth_reset_password/domain/providers/auth_reset_pass_domain_provider.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_email_provider.dart';
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: emailValid == true
              ? () {
                  ref
                      .read(authResetPasswordDomainProvider)
                      .sendRecoveryCode(email: emailImput);
                  context.goNamed('updatepass', extra: emailImput);
                }
              : () {
                  log('loshara');
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
            child: Text(
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
