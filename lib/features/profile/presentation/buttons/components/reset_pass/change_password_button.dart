import 'dart:math';

import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/send_reset_pass_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordButton extends ConsumerStatefulWidget {
  final String emailUser;
  const ChangePasswordButton({super.key, required this.emailUser});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordButton();
}

class _ChangePasswordButton extends ConsumerState<ChangePasswordButton> {
  bool networkError = false;
  String text = 'Сменить пароль';

  void showError() async {
    setState(() {
      networkError = true;
      text = 'Поробуйте позже';
    });
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        networkError = false;
        text = 'Сменить пароль';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sendCodeProviderState =
        ref.watch(sendResetPassCodeControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 39, right: 39, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(
                colors: networkError
                    ? [
                        Theme.of(context).colorScheme.errorContainer,
                        Theme.of(context).colorScheme.error,
                      ]
                    : [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary,
                      ],
                transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: () async {
              final codeSended = await ref
                  .read(sendResetPassCodeControllerProvider.notifier)
                  .sendResetCode(email: widget.emailUser);
              if (codeSended) {
                // ignore: use_build_context_synchronously
                context.goNamed('enterrecoverycodeinprofile',
                    extra: widget.emailUser);
              } else {
                // ignore: use_build_context_synchronously
                showError();
              }
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: FittedBox(
              child: sendCodeProviderState.isLoading
                  ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onSecondary)
                  : Text(
                      text,
                      textScaler: const TextScaler.linear(1),
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
