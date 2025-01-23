import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpMainWidget extends ConsumerStatefulWidget {
  const SignUpMainWidget({super.key});

  @override
  SignUpMainWidgetState createState() => SignUpMainWidgetState();
}

class SignUpMainWidgetState extends ConsumerState<SignUpMainWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  IconData iconPassword = Icons.visibility;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Создание аккаунта',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [],
      ),
    );
  }
}
