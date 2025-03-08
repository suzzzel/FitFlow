// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthSelectButton extends StatelessWidget {
  final String text;
  final bool isLogin;
  final Function()? onPressed;
  const AuthSelectButton({
    super.key,
    required this.text,
    required this.isLogin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 34),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(99)),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(64, 35, 215, 1),
                Color.fromRGBO(152, 59, 203, 1)
              ], transform: GradientRotation(pi / 4))),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold)),
                foregroundColor: const WidgetStatePropertyAll(Colors.white)),
            onPressed: onPressed,
            child: Text(
              text,
            ),
          )),
    );
  }
}
