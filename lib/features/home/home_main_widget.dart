import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/presentation/week_progress_today_train_main_widget.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/train_info_main_widget.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/welcome_train.dart';
import 'package:fitflow/features/train/get_training_plan/domain/providers/get_training_plan_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.125),
      child: ListView(
        padding: const EdgeInsets.only(top: 50),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          WelcomeTrain(
            isPlanExist:
                trainingPlan.hasValue == true && trainingPlan.value!.isNotEmpty,
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
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
