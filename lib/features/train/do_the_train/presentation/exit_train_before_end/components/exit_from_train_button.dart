// ignore_for_file: use_build_context_synchronously, unused_result

import 'dart:math';

import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/providers/get_today_train_info_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ExitFromTrainButton extends ConsumerWidget {
  const ExitFromTrainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.errorContainer,
            ], transform: const GradientRotation(pi / 2))),
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            onPressed: trainNotifier.tempExercise > 1
                ? !trainNotifier.isTrainWasAllSkipped()
                    ? () async {
                        final isExitReady = await ref
                            .read(completeTrainProvider)
                            .completeTrain(train: trainNotifier);
                        isExitReady ? ref.refresh(authStateProvider) : () {};
                        context.goNamed('/home');
                        ref.invalidate(
                            getTodayTrainInfoDomainProviderAsyncProvider);
                        ref.invalidate(tempTrainStateNotifierProvider);
                      }
                    : () async {
                        final isExitReady = await ref
                            .read(completeTrainProvider)
                            .exitFromTrainWithoutSaving();
                        isExitReady ? ref.refresh(authStateProvider) : () {};
                        context.goNamed('/home');
                        ref.invalidate(tempTrainStateNotifierProvider);
                      }
                : () async {
                    final isExitReady = await ref
                        .read(completeTrainProvider)
                        .exitFromTrainWithoutSaving();
                    isExitReady ? ref.refresh(authStateProvider) : () {};
                    context.goNamed('/home');
                    ref.invalidate(tempTrainStateNotifierProvider);
                  },
            child: Text('Закончить тренировку',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSecondary))),
      ),
    );
  }
}
