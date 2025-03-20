import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/indicators/indicators_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/progress_temp_week_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/train_start_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/welcome_info_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/welcome_train.dart';
import 'package:fitflow/features/train/get_temp_week_progress/data/providers/get_temp_week_progress_data_provider.dart';
import 'package:fitflow/features/train/get_training_plan/domain/providers/get_training_plan_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeMainWidget extends ConsumerWidget {
  const HomeMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    final trainingPlan =
        ref.watch(getTrainingPlanDomainProviderAsyncProvider(id: user.id!));
    return Stack(
      children: [
        // WelcomeInformationWidget(user: user),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.125),
          child: ListView(
            padding: const EdgeInsets.only(top: 50),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              // IndicatorsMainWidget(user: user),

              WelcomeTrain(
                todayDate:
                    '${DateFormat.MMM().format(DateTime.now())}, ${DateTime.now().day}',
              ),
              TrainingPlanMainWidget(
                trainingPlan: trainingPlan.hasValue ? trainingPlan.value : [],
                isPlanLoading: trainingPlan.isLoading,
              ),
              const ProgressTempWeekMainWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SignOutButton(),
                  Text(user.name!),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Offline mode',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                          children: [
                            TextSpan(
                                text: ' ${user.offlineMode ?? 'false'}',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: user.offlineMode == true
                                        ? Colors.red
                                        : Colors.green)),
                          ])),
                  ElevatedButton(
                      onPressed: () {
                        // ref
                        //     .read(localDatabaseProvider)
                        //     .managers
                        //     .trainingPlanTable
                        //     .delete();
                        ref
                            .read(getTempWeekProgressDataProvider)
                            .getTempWeekTrainings();
                      },
                      child: const Text('clear')),
                ],
              ),
              const ProgressTempWeekMainWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
