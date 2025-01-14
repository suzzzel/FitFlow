import 'dart:developer';

import 'package:fitflow/features/auth/auth_signIn/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_signIn/presentation/controllers/sign_in_controller.dart';
import 'package:fitflow/features/auth/auth_signIn/presentation/sign_in_button.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
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
    final emailInput = ref.watch(emailProvider.notifier);
    final passImput = ref.watch(passwordProvider.notifier);
    final firstImput = ref.watch(firstImputProvider);
    final signInController = ref.watch(signInControllerProvider);
    signInController.hasError ? log('error') : ();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              ref.watch(firstImputProvider.notifier).state = true;
              ref.watch(isDataSignInValidProvider.notifier).state = false;
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: Text(
          'Авторизация',
          style: GoogleFonts.inter(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 24,
              fontWeight: FontWeight.w500),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 46, right: 47, bottom: 8),
                child: CustomTextField(
                  controller: emailController,
                  obscureText: false,
                  onChanged: (value) {
                    log(emailController.text);
                    emailInput.state = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Имя пользователя или email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 46, right: 47, bottom: 7),
                child: CustomTextField(
                  onChanged: (value) {
                    log(passwordController.text);
                    passImput.state = value;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                          iconPassword = obscurePassword
                              ? Icons.visibility
                              : iconPassword = Icons.visibility_off;
                        });
                      },
                      icon: Icon(
                        iconPassword,
                        color: obscurePassword
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.onSurface,
                      )),
                  controller: passwordController,
                  obscureText: obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: 'Пароль',
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 54),
                  child: TextButton(
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
                      onPressed: () {},
                      child: FittedBox(
                        child: Text(
                          'Забыли пароль?',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.8)),
                        ),
                      )),
                ),
              ),
              !firstImput
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 23, right: 44, left: 44),
                      child: FittedBox(
                        child: Text(
                          'Неверное имя пользователя или email',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(255, 10, 10, 0.8)),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
