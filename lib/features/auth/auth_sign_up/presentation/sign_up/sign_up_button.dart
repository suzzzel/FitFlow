import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends ConsumerStatefulWidget {
  const SignUpButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewSignUpButtonState();
}

class _NewSignUpButtonState extends ConsumerState<SignUpButton> {
  bool networkError = false;
  String text = 'Создать аккаунт';

  void showError(bool newtworkOrAlreadyExist) async {
    setState(() {
      networkError = true;
      text = newtworkOrAlreadyExist
          ? 'Отсутствует подключение к сети'
          : 'Аккаунт уже существует';
    });
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        networkError = false;
        text = 'Создать аккаунт';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state = ref.watch(signUpControllerProvider);
    final email = ref.watch(emailSignUpProvider.notifier);
    final password = ref.watch(passwordSignUpProvider.notifier);
    final name = ref.watch(nameSignUpProvider.notifier);
    final userNotif = ref.watch(regUserProvider.notifier);
    final isButtonActive = ref.watch(isDataSignUpValidProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18),
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
            onPressed: () async {
              if (!state.isLoading && !networkError) {
                if (isButtonActive.state && !networkError) {
                  userNotif.addCreateAt();
                  userNotif.addEmail(email.state);
                  userNotif.addName(name.state);
                  final response = await ref
                      .read(signUpControllerProvider.notifier)
                      .signUp(
                          email: email.state,
                          password: password.state,
                          user: ref.read(regUserProvider));
                  if (response != null) {
                    if (!response) {
                      showError(false); // already ex
                    } else {
                      showError(true); // network error
                    }
                  }
                }
              }
            },
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 70)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: state.isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSecondary)
                : FittedBox(
                    child: Text(
                      text,
                      style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
      ),
    );
  }
}
