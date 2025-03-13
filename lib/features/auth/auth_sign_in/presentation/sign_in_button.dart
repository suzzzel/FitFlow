import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_in/domain/models/sign_in_state.dart';
import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_sign_in/presentation/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends ConsumerStatefulWidget {
  const SignInButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewSignInButtonState();
}

class _NewSignInButtonState extends ConsumerState<SignInButton> {
  bool networkError = false;
  String text = 'Продолжить';

  void showNetworkError() async {
    setState(() {
      networkError = true;
      text = 'Отсутствует подключение к сети';
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      networkError = false;
      text = 'Продолжить';
    });
  }

  @override
  Widget build(BuildContext context) {
    final signIn = ref.watch(signInControllerNEWProvider.notifier);
    final stateSignIn = ref.watch(signInControllerNEWProvider);
    final firtImput = ref.watch(firstImputProvider.notifier);
    final emailOrName = ref.watch(emailOrNameProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);
    final isButtonActive = ref.watch(isDataSignInValidProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(
        left: 41,
        right: 37,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(
                colors: isButtonActive.state
                    ? networkError
                        ? [
                            Theme.of(context).colorScheme.errorContainer,
                            Theme.of(context).colorScheme.error,
                          ]
                        : [
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.primary,
                          ]
                    : [
                        Theme.of(context).colorScheme.secondaryFixedDim,
                        Theme.of(context).colorScheme.primaryFixedDim,
                      ],
                transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: stateSignIn.isLoading || networkError
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
                          password.state = '';
                          emailOrName.state = '';
                        case SignInState.networkError:
                          showNetworkError();
                        case SignInState.notAuth:
                          firtImput.state = false;
                      }
                    } else {
                      firtImput.state = false;
                    }
                  },
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: stateSignIn.isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSecondary)
                : FittedBox(
                    child: Text(
                      text,
                      style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
      ),
    );
  }
}
