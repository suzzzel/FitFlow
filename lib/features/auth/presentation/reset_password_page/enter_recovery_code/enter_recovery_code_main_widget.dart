import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_otp_code.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/enter_code_pin_imput.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_code_to_reset_password_controller.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/enter_recovery_code_text.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/error_text_recovery_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterRecoveryCodeMainWidget extends ConsumerWidget {
  final String email;
  final String recoveryCodeText;
  const EnterRecoveryCodeMainWidget(
      {super.key, required this.email, required this.recoveryCodeText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpImput = ref.watch(otpResetPasswordProvider.notifier);
    final state = ref.watch(enterCodeToResetPasswordControllerProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: const Alignment(0, -0.6),
          child: EnterRecoveryCodeText(
            recoveryTextFromRoute: recoveryCodeText,
          ),
        ),
        EnterCodePinImput(email: email),
        ErrorTextRecoveryCode(state: state, otpImput: otpImput.state),
      ],
    );
  }
}
