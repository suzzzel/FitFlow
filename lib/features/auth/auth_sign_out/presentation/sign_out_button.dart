import 'dart:math';
import 'package:fitflow/features/auth/auth_sign_out/presentation/controllers/sign_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signOutControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 39, right: 39, top: 10, bottom: 130),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixedDim.withOpacity(0.8),
              Theme.of(context).colorScheme.secondaryFixedDim.withOpacity(0.8),
            ], transform: const GradientRotation(pi / 4))),
        child: ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () async {
                  await ref.read(signOutControllerProvider.notifier).signOut();
                },
          style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 60)),
              backgroundColor:
                  const WidgetStatePropertyAll(Colors.transparent)),
          child: Text(
            'Выйти',
            textScaler: const TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
