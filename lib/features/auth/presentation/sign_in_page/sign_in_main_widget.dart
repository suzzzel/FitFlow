import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_sign_in/presentation/sign_in_button.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/email_or_name_imput_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/error_sign_in_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/forgot_password_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/password_imput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInMainWidget extends ConsumerStatefulWidget {
  const SignInMainWidget({super.key});

  @override
  SignInMainWidgetState createState() => SignInMainWidgetState();
}

class SignInMainWidgetState extends ConsumerState<SignInMainWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  IconData iconPassword = Icons.visibility;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailInput = ref.watch(emailOrNameProvider.notifier);
    final firstImput = ref.watch(firstImputProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: SignInButton(
              key: Key('sign_in_second_button'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 250),
          child: ErrorSignInWidget(error: !firstImput),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailOrNameImputWidget(
                key: const Key('emain_sign_in'),
                emailController: emailController,
                emailInput: emailInput),
            PasswordImputWidget(
              key: const Key('password_sign_in'),
              passwordController: passwordController,
            ),
            const ForgotPasswordWidget(),
          ],
        ),
      ],
    );
  }
}
