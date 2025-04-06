import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_level_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterLevelSelectButton extends ConsumerWidget {
  const NextStepAfterLevelSelectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(selectLevelProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: prov != ''
                ? LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ], transform: const GradientRotation(pi / 4))
                : LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondaryFixedDim,
                    Theme.of(context).colorScheme.primaryFixedDim,
                  ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: prov == ''
                ? null
                : () {
                    ref.read(regUserProvider.notifier).addLevel(prov);
                    context.goNamed('signup');
                  },
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: FittedBox(
              child: Text(
                'Продолжить',
                textScaler: const TextScaler.linear(1),
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            )),
      ),
    );
  }
}
