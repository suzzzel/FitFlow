import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 54),
        child: TextButton(
            style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
            onPressed: () {
              context.goNamed('resetpass');
            },
            child: FittedBox(
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => const LinearGradient(colors: [
                  Color.fromRGBO(204, 143, 237, 1),
                  Color.fromRGBO(107, 80, 246, 1),
                ]).createShader(bounds),
                child: Text(
                  'Забыли пароль?',
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
