import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/progress/data/providers/main_progress_providers.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/week_progress_today_train_main_widget.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/train_info_main_widget.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/welcome_train.dart';
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
    final timeNow = DateTime.now();
    final weekDayNow = DateFormat('EEEE').format(timeNow).toLowerCase();
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.125),
          child: ListView(
            padding: const EdgeInsets.only(top: 50),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              WelcomeTrain(
                isPlanExist: trainingPlan.hasValue == true &&
                    trainingPlan.value!.isNotEmpty,
                isTodayChillday: trainingPlan.value?.indexWhere(
                            (element) => element.dayOfWeek == weekDayNow) !=
                        -1
                    ? false
                    : true,
                todayDate:
                    '${DateFormat.MMM().format(DateTime.now())}, ${DateTime.now().day}',
              ),
              TrainingPlanMainWidget(
                trainingPlan: trainingPlan.hasValue ? trainingPlan.value : [],
                isPlanLoading: trainingPlan.isLoading,
                weekDayNow: weekDayNow,
                timeNow: timeNow,
              ),
              WeekProgressTodayTrainMainWidget(
                trainingPlan: trainingPlan.hasValue ? trainingPlan.value : [],
                isPlanLoading: trainingPlan.isLoading,
                todayDate:
                    '${DateFormat.MMM().format(DateTime.now())}, ${DateTime.now().day}',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(
                      height: 300,
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              // context.goNamed('/progresshome');
                              // ref
                              //     .read(localDatabaseProvider)
                              //     .managers
                              //     .trainingTable
                              //     .delete();
                              // ref
                              //     .read(localDatabaseProvider)
                              //     .managers
                              //     .trainingPlanTable
                              //     .delete();

                              ref.read(getMainProgressProvider);
                              // ref
                              //     .read(localDatabaseProvider)
                              //     .managers
                              //     .trainingTable
                              //     .create((f) => f(
                              //         dayOfTraining: '2025-05-22',
                              //         // типа сделал треню
                              //         exerciseOne: '2',
                              //         countRepsExOne: 5,
                              //         maxWeightExOne: '110',
                              //         percentOfTrainDone: 70,
                              //         idUser: user.id!));
                              // ref
                              //     .read(localDatabaseProvider)
                              //     .managers
                              //     .trainingTable
                              //     .create((f) => f(
                              //         dayOfTraining: '2025-03-23',
                              //         exerciseOne: '115',
                              //         countRepsExOne: 5,
                              //         maxWeightExOne: '110',
                              //         percentOfTrainDone: 65,
                              //         idUser: 'test'));
                              // ref
                              //     .read(localDatabaseProvider)
                              //     .managers
                              //     .trainingTable
                              //     .filter((f) => f.dayOfTraining('2025-03-19'))
                              //     .delete();
                            },
                            child: const Text('stage button :)')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
