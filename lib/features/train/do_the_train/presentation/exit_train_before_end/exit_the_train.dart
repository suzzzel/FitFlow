import 'package:fitflow/features/train/do_the_train/presentation/exit_train_before_end/components/back_to_train_button.dart';
import 'package:fitflow/features/train/do_the_train/presentation/exit_train_before_end/components/exit_from_train_button.dart';
import 'package:fitflow/features/train/do_the_train/presentation/exit_train_before_end/components/info_about_exit.dart';

import 'package:flutter/material.dart';

class ExitTheTrainButton extends StatelessWidget {
  const ExitTheTrainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 370,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoAboutExit(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackToTrainButton(),
                  ExitFromTrainButton(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
