import 'dart:developer';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signUpControllerProvider);
    final email = ref.watch(emailSignUpProvider.notifier);
    final password = ref.watch(passwordSignUpProvider.notifier);
    final name = ref.watch(nameSignUpProvider.notifier);
    final userNotif = ref.watch(regUserProvider.notifier);
    final isButtonActive = ref.watch(isDataSignUpValidProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: () async {
            if (!state.isLoading) {
              if (isButtonActive.state) {
                userNotif.addCreateAt();
                userNotif.addLevel('beginner');
                userNotif.addEmail(email.state);
                userNotif.addName(name.state);
                final response = await ref
                    .read(signUpControllerProvider.notifier)
                    .signUp(
                        email: email.state,
                        password: password.state,
                        user: ref.read(regUserProvider));
                if (!response) {
                  isButtonActive.state = false;
                  password.state = '';
                  email.state = '';
                } else {}
              }
            }
          },
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 70)),
              backgroundColor: WidgetStatePropertyAll(
                isButtonActive.state
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
              )),
          child: state.isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSecondary)
              : FittedBox(
                  child: Text(
                    'Создать аккаунт',
                    style: GoogleFonts.inter(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                )),
    );
  }
}
