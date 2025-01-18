import 'package:fitflow/features/auth/presentation/auth_select_button.dart';
import 'package:fitflow/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthMainWidget extends StatelessWidget {
  const AuthMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/auth/background.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Theme.of(context).colorScheme.secondary,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 50,
                      ),
                    ]),
                child: Image.asset(
                  'assets/logo/logo.png',
                ),
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
                    height: 10,
                  ),
                  AuthSelectButton(
                      text: 'Зарегистрироваться',
                      isLogin: false,
                      onPressed: () => context.pushNamed(RouterPath.GENDER)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
