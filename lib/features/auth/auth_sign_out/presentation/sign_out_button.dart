import 'package:fitflow/features/auth/auth_sign_out/presentation/controllers/sign_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(signOutControllerProvider);
    return ElevatedButton(
        onPressed: state.isLoading
            ? null
            : () => ref.read(signOutControllerProvider.notifier).signOut(),
        child: state.isLoading ? Text('loading...') : Text('sign out'));
  }
}
