// ignore_for_file: use_build_context_synchronously
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/confirm_delete_plan/components/accept_button_delete_train_plan.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/confirm_delete_plan/components/back_button_delete_train_plan.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/confirm_delete_plan/components/info_about_delete.dart';
import 'package:flutter/material.dart';

Future<dynamic> confirmDeletePlan(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 200,
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
                InfoAboutDeleteTrainPlan(),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AcceptButtonDeleteTrainPlan(),
                      BackButtonDeleteTrainPlan()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
