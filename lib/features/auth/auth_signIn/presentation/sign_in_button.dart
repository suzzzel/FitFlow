import 'package:fitflow/features/auth/auth_signIn/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_signIn/presentation/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signInControllerProvider);
    final signIn = ref.watch(signInControllerProvider.notifier);
    final firtImput = ref.watch(firstImputProvider.notifier);
    final emailOrName = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    final isButtonActive = ref.watch(isDataSignInValidProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () async {
                  firtImput.state = true;
                  if (isButtonActive.state) {
                    final response = await signIn.signIn(
                      emailOrName: emailOrName.state,
                      password: password.state,
                    );
                    if (!response) {
                      isButtonActive.state = false;
                      password.state = '';
                      emailOrName.state = '';
                    } else {
                      firtImput.state = !response;
                    }
                  } else {
                    firtImput.state = false;
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
                    'Продолжить',
                    style: GoogleFonts.inter(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                )),
    );
  }
}
