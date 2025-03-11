import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_gender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterGenderButton extends ConsumerWidget {
  const NextStepAfterGenderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderController = ref.watch(selectGenderProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: genderController != 0
                ? LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ], transform: const GradientRotation(pi / 4))
                : LinearGradient(colors: [
                    Theme.of(context).colorScheme.secondaryFixedDim,
                    Theme.of(context).colorScheme.primaryFixedDim,
                  ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: genderController == 0
                ? null
                : () {
                    ref
                        .read(regUserProvider.notifier)
                        .addGender(genderController == 1 ? true : false);
                    context.goNamed('weight');
                  },
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 60)),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent)),
            child: FittedBox(
              child: Text(
                'Продолжить',
                style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            )),
      ),
    );
  }
}
