import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/profile/domain/providers/home_buttons_domain_provider.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/contact_developer/contact_developer_button.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/delete_train_plan/delete_train_button.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/legal_information/legal_information_button.dart';
import 'package:fitflow/features/profile/presentation/buttons/components/reset_pass/change_password_button.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/weekday_for_creating_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/select_weekday_custom_plan.dart';
import 'package:fitflow/features/train/create_training_plan/domain/providers/temp_train_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
          ElevatedButton(
              onPressed: () async {
                final homeButtonRepo = ref.read(homeButtonsDomainProvider);
                final tempPlan = await homeButtonRepo.getTempPlanToEdit();
                if (tempPlan.isEmpty) {
                  showTopSnackBar(
                      Overlay.of(context),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            gradient: LinearGradient(colors: [
                              Theme.of(context).colorScheme.errorContainer,
                              Theme.of(context).colorScheme.error,
                            ])),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Center(
                            child: Text(
                              'Сначала необходимо создать тренировочный план :)',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ));
                } else {
                  ref
                      .read(tempTrainPlanProvider.notifier)
                      .loadExistPlan(existPlan: tempPlan);
                  ref
                      .read(selectWeekdayCustomPlanProvider.notifier)
                      .loadExistWeekDay(weekdays: tempPlan.keys.toList());
                  context.goNamed('selectweekdaytoeditsavedplan');
                }
              },
              child: Text('edit plan')),
          ChangePasswordButton(
            emailUser: user.email!,
          ),
          const DeleteTrainPlanButton(),
          const ContactDeveloperButton(),
          const LegalInformationButton(),
          const SignOutButton(),
        ],
      ),
    );
  }
}
