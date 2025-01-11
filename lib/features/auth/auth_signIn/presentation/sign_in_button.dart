import 'package:fitflow/features/auth/auth_signIn/presentation/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends ConsumerWidget {
  final bool isActive;
  const SignInButton({super.key, required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signInControllerProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21),
      child: ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () => ref
                  .read(signInControllerProvider.notifier)
                  .signIn(emailOrName: 'test', password: '123123'),
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 70)),
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.secondary,
              )),
          child: state.isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSecondary)
              : FittedBox(
                  child: Text(
                    'Продолжить',
                    style: GoogleFonts.inter(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                )),
    );
  }
}
