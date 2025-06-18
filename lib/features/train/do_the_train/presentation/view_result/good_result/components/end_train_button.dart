import 'dart:math';

import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/providers/get_today_train_info_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EndTrainButton extends ConsumerWidget {
  const EndTrainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 41, right: 43, bottom: 35),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(99)),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ], transform: const GradientRotation(pi / 2))),
          child: ElevatedButton(
              style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width, 60)),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent)),
              onPressed: () async {
                ref.invalidate(getTodayTrainInfoDomainProviderAsyncProvider);
                ref.invalidate(authStateProvider);
              },
              child: Text('Закончить тренировку',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSecondary))),
        ),
      ),
    );
  }
}
