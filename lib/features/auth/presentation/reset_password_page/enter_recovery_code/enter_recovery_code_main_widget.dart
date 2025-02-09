import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_otp_code.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/enter_code_pin_imput.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/controllers/enter_code_to_reset_password_controller.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/enter_recovery_code_text.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/error_text_recovery_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterRecoveryCodeMainWidget extends ConsumerWidget {
  final String email;
  const EnterRecoveryCodeMainWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpImput = ref.watch(otpResetPasswordProvider.notifier);
    final state = ref.watch(enterCodeToResetPasswordControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              otpImput.state = '';
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        titleSpacing: 0,
        title: FittedBox(
          child: Text(
            'Восстановление пароля',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment(0, -0.6),
            child: EnterRecoveryCodeText(),
          ),
          EnterCodePinImput(email: email),
          ErrorTextRecoveryCode(state: state, otpImput: otpImput.state),
        ],
      ),
    );
  }
}
