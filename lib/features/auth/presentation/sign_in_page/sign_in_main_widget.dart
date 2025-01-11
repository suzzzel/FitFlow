import 'package:fitflow/features/auth/auth_signIn/presentation/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInMainWidget extends StatelessWidget {
  const SignInMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: SignInButton(
                isActive: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
