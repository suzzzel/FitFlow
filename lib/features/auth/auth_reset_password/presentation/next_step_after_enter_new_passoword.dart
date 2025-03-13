import 'dart:math';

import 'package:fitflow/features/auth/auth_reset_password/domain/models/reset_pass_enums.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_new_pass.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_new_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNextStepAfterEnterNewPassword extends ConsumerStatefulWidget {
  const NewNextStepAfterEnterNewPassword({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewNextStepAfterEnterNewPasswordState();
}

class _NewNextStepAfterEnterNewPasswordState
    extends ConsumerState<NewNextStepAfterEnterNewPassword> {
  bool networkError = false;
  String text = 'Продолжить';

  void showError(bool newtworkOrNewPassword) async {
    setState(() {
      networkError = true;
      text = newtworkOrNewPassword
          ? 'Отсутствует подключение к сети'
          : 'Используйте другой пароль';
    });
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        networkError = false;
        text = 'Продолжить';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final passwordVaild = ref.watch(isValidNewPasswordResetPasswordProvider);
    final passRepeatValid =
        ref.watch(isValidpasswordRepeatResetPasswordProvider);
    final passImput = ref.watch(newPasswordResetPasswordProvider);
    final state = ref.watch(updatePassControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 43,
        right: 35,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(
                colors: passwordVaild == true && passRepeatValid == true
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
            onPressed: passwordVaild == true &&
                    passRepeatValid == true &&
                    !networkError
                ? () async {
                    final valid = await ref
                        .read(updatePassControllerProvider.notifier)
                        .updatePass(newPassword: passImput);
                    switch (valid) {
                      case UpdatePasswordStatus.sucess:
                        break;
                      case UpdatePasswordStatus.networkError:
                        showError(true);
                      case UpdatePasswordStatus.failure:
                        showError(false);
                    }
                  }
                : () {},
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: FittedBox(
              child: state.isLoading
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
