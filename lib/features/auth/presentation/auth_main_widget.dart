import 'package:fitflow/features/auth/presentation/auth_select_button.dart';
import 'package:fitflow/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthMainWidget extends StatelessWidget {
  const AuthMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.40,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondaryFixed,
                    Theme.of(context).colorScheme.primaryFixed,
                  ]).createShader(bounds),
                  child: Text(
                    'FIT FLOW',
                    textScaler: const TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
              Text(
                'Не плыви по течению',
                textAlign: TextAlign.center,
                textScaler: const TextScaler.linear(1),
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: const Color.fromRGBO(182, 180, 193, 1)),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthSelectButton(
                  text: 'Войти',
                  isLogin: true,
                  onPressed: () => context.pushNamed(RouterPath.SIGNIN)),
              const SizedBox(
                height: 16,
              ),
              AuthSelectButton(
                  text: 'Зарегистрироваться',
                  isLogin: false,
                  onPressed: () => context.pushNamed(RouterPath.GENDER)),
            ],
          ),
        ),
      ),
    ]);
  }
}
