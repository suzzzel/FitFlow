import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_sign_in/presentation/sign_in_button.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/email_or_name_imput_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/error_sign_in_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/forgot_password_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_in_page/components/password_imput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Widget build(BuildContext context) {
    final emailInput = ref.watch(emailOrNameProvider.notifier);
    final passImput = ref.watch(passwordProvider.notifier);
    final firstImput = ref.watch(firstImputProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              ref.watch(firstImputProvider.notifier).state = true;
              ref.watch(isDataSignInValidProvider.notifier).state = false;
              emailInput.state = '';
              passImput.state = '';
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Авторизация',
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
              child: SignInButton(),
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
                  emailController: emailController, emailInput: emailInput),
              PasswordImputWidget(
                passwordController: passwordController,
              ),
              const ForgotPasswordWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
