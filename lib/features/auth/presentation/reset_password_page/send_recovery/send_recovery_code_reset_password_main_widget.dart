import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_email_provider.dart';
import 'package:fitflow/features/auth/auth_reset_password/presentation/next_step_after_send_recovery_code.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/send_recovery/send_recovery_text.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/email_imput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SendRecoveryCodeResetPasswordMainWidget extends ConsumerStatefulWidget {
  const SendRecoveryCodeResetPasswordMainWidget({super.key});

  @override
  ResetPasswordMainWidgetState createState() => ResetPasswordMainWidgetState();
}

class ResetPasswordMainWidgetState
    extends ConsumerState<SendRecoveryCodeResetPasswordMainWidget> {
  final emailController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final emailInput = ref.watch(emailResetPasswordProvider.notifier);
    final emailValid = ref.watch(isValidEmailResetPasswordProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              emailInput.state = '';
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
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: NextStepAfterSendRecoveryCodeButton(),
            ),
          ),
          const Align(alignment: Alignment(0, 0.44), child: SendRecoveryText()),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailSignUpImputWidget(
                emailController: emailController,
                emailImput: emailInput,
                isValidEmail: emailValid,
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
