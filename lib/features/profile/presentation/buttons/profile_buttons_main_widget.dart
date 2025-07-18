import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/contact_developer/contact_developer_button.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/delete_train_button.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/legal_information/legal_information_button.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/reset_pass/change_password_button.dart';
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
          DeleteTrainPlanButton(),
          ContactDeveloperButton(),
          LegalInformationButton(),
          SignOutButton(),
        ],
      ),
    );
  }
}
