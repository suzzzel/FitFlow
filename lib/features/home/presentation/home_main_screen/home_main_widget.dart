import 'dart:developer';

import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/home/home_main_screen/domain/providers/home_quotes_domain_provider.dart';
import 'package:fitflow/features/home/home_main_screen/presentation/daily_quote_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/indicators/indicators_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/train_start_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/welcome_info_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/welcome_train.dart';
import 'package:fitflow/features/train/domain/providers/training_plan_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMainWidget extends ConsumerWidget {
  const HomeMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    final quoteDay = ref.watch(homeQuotesDataProviderAsyncProvider);
    final trainingPlan =
        ref.watch(trainingPlanDomainProviderAsyncProvider(id: user.id!));
    return Scaffold(
        body: Stack(
      children: [
        WelcomeInformationWidget(user: user),
        Padding(
          padding: const EdgeInsets.only(top: 203),
          child: ListView(
            padding: const EdgeInsets.only(top: 30),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              IndicatorsMainWidget(user: user),
              const WelcomeTrain(),
              TrainStartMainWidget(
                id: user.id!,
                trainingPlan: trainingPlan.hasValue ? trainingPlan.value : [],
                isPlanLoading: trainingPlan.isLoading,
              ),
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
                              color: Theme.of(context).colorScheme.onPrimary),
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
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Наличие тренировочного плана',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary),
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
                        ref
                            .read(localDatabaseProvider)
                            .managers
                            .trainingPlanTable
                            .delete();
                      },
                      child: const Text('clear')),
                  Text(quoteDay.toString())
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 152, left: 17),
          child: SizedBox(
            width: 327,
            height: 58,
            child:
                QuoteNew(tempQuote: quoteDay.hasValue ? quoteDay.value! : []),
          ),
        ),
      ],
    ));
  }
}
