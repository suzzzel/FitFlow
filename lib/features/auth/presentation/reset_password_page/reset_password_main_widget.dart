import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/email_imput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordMainWidget extends ConsumerStatefulWidget {
  const ResetPasswordMainWidget({super.key});

  @override
  ResetPasswordMainWidgetState createState() => ResetPasswordMainWidgetState();
}

class ResetPasswordMainWidgetState
    extends ConsumerState<ResetPasswordMainWidget> {
  final emailController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final emailInput = ref.watch(emailSignUpProvider.notifier);
    final emailValid = ref.watch(isValidEmailSignUpProvider);
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
        title: FittedBox(
          child: Text(
            'Восстановить пароль',
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: ElevatedButton(onPressed: () {}, child: Text('test')),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmailSignUpImputWidget(
                emailController: emailController,
                emailImput: emailInput,
                isValidEmail: emailValid,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
