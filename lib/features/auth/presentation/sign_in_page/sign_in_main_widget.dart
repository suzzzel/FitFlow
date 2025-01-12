import 'dart:developer';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
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
              child: SignInButton(
                isActive: true,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 46, right: 47),
                child: CustomTextField(
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Имя пользователя или email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 46, right: 47),
                child: CustomTextField(
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Имя пользователя или email',
                ),
              ),
            ],
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       log(emailController.text);
          //     },
          //     child: Text('test'))
        ],
      ),
    );
  }
}
