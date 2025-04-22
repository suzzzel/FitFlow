import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterHeightSelectButton extends ConsumerWidget {
  const NextStepAfterHeightSelectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(selectHeightMainProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 39,
        right: 39,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
            onPressed: () {
              ref.read(regUserProvider.notifier).addHeight(prov);
              context.goNamed('age');
            },
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            )),
      ),
    );
  }
}
