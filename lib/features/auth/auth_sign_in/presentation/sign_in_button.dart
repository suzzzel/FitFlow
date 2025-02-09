import 'package:fitflow/features/auth/auth_sign_in/domain/models/sign_in_state.dart';
import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_sign_in/presentation/controllers/sign_in_controller.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/snackbars/network_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signIn = ref.watch(signInControllerNEWProvider.notifier);
    final stateSignIn = ref.watch(signInControllerNEWProvider);
    final firtImput = ref.watch(firstImputProvider.notifier);
    final emailOrName = ref.watch(emailOrNameProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    final isButtonActive = ref.watch(isDataSignInValidProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: stateSignIn.isLoading
              ? () {}
              : () async {
                  firtImput.state = true;
                  if (isButtonActive.state) {
                    final response = await signIn.signIn(
                      emailOrName: emailOrName.state,
                      password: password.state,
                    );
                    switch (response) {
                      case SignInState.auth:
                        isButtonActive.state = false;
                      case SignInState.networkError:
                        // ignore: use_build_context_synchronously
                        showNetworkError(context);
                      case SignInState.notAuth:
                        firtImput.state = false;
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
          child: stateSignIn.isLoading
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
