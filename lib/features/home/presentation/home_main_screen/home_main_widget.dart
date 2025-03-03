import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/home/home_main_screen/domain/providers/home_quotes_domain_provider.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/indicators/indicators_main_widget.dart';
import 'package:fitflow/features/home/presentation/home_main_screen/components/welcome_info_widget.dart';
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
        ref.watch(trainingPlanDomainProviderAsyncProvider.notifier);
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
                        trainingPlan.getTrainingPlan(id: user.id!);
                      },
                      child: Text('check')),
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

class QuoteNew extends ConsumerStatefulWidget {
  final List<String> tempQuote;
  const QuoteNew({super.key, required this.tempQuote});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuoteNewState();
}

class _QuoteNewState extends ConsumerState<QuoteNew> {
  @override
  void initState() {
    ref.read(homeQuotesDataProviderAsyncProvider.notifier).getQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
              text: widget.tempQuote.isNotEmpty ? widget.tempQuote.first : '',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimary),
              children: [
            TextSpan(
                text: widget.tempQuote.isNotEmpty ? widget.tempQuote.last : '',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary))
          ])),
    );
  }
}
