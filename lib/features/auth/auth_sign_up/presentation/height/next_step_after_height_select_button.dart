import 'dart:developer';

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
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: prov == 0
              ? null
              : () {
                  ref.read(regUserProvider.notifier).addHeight(prov);
                  log(prov.toString());
                  context.goNamed('age');
                },
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 70)),
              backgroundColor: WidgetStatePropertyAll(
                prov != 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
              )),
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
    );
  }
}
