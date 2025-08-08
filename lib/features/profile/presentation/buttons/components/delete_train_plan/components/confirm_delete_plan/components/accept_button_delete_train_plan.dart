// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/error_delete_train_plan_snackbar.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/components/success_delete_train_plan_snackbar.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/controller/delete_train_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptButtonDeleteTrainPlan extends StatelessWidget {
  const AcceptButtonDeleteTrainPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.tertiaryFixedDim,
            ], transform: const GradientRotation(pi / 2))),
        child: Consumer(builder: (context, ref, child) {
          final deleteTrainState = ref.watch(deleteTrainPlanControllerProvider);
          final deleteTrain =
              ref.watch(deleteTrainPlanControllerProvider.notifier);
          return ElevatedButton(
              onPressed: deleteTrainState.isLoading
                  ? () {}
                  : () async {
                      final response = await deleteTrain.deleteTrain();
                      if (response) {
                        sucessDeleteTrainButtonSnackBar(context);
                        context.pop();
                      } else {
                        errorDeleteTrainButtonSnackBar(context);
                        context.pop();
                      }
                    },
              style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.35, 35)),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent)),
              child: deleteTrainState.isLoading
                  ? const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      ),
                    )
                  : Text('Удалить',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSecondary)));
        }));
  }
}
