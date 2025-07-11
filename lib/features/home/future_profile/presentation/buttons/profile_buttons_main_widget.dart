import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/home/future_profile/presentation/buttons/components/change_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileButtonsMainWidget extends ConsumerWidget {
  const ProfileButtonsMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ChangePasswordButton(
            emailUser: user.email!,
          ),
          ElevatedButton(onPressed: () {}, child: Text('delete train plan')),
          ElevatedButton(onPressed: () {}, child: Text('exit from profile')),
          ElevatedButton(onPressed: () {}, child: Text('contact developer')),
          ElevatedButton(onPressed: () {}, child: Text('legal information'))
        ],
      ),
    );
  }
}
