import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/profile/presentation/buttons/profile_buttons_main_widget.dart';
import 'package:fitflow/features/profile/presentation/indicators_view/indicators/indicators_main_widget.dart';
import 'package:fitflow/features/profile/presentation/welcome_info/welcome_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileMainWidget extends ConsumerWidget {
  const ProfileMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.12,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          WelcomeInformationWidget(user: user),
          IndicatorsMainWidget(
            user: user,
          ),
          const ProfileButtonsMainWidget()
        ],
      ),
    );
  }
}
