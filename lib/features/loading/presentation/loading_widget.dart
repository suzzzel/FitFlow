import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

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
            padding: const EdgeInsets.only(
              top: 165,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
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
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
                strokeWidth: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
