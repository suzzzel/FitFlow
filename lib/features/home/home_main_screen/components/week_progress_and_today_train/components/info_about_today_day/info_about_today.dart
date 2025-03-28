import 'package:fitflow/features/home/home_main_screen/components/today_date_home_screen_text.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/providers/get_today_train_info_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAboutToday extends ConsumerWidget {
  const InfoAboutToday(
      {super.key,
      required this.date,
      required this.isActivityTodayExist,
      required this.todayTrain,
      this.percentActivity});

  final String date;
  final bool isActivityTodayExist;
  final int? percentActivity;
  final AsyncValue<TrainingDayClass?> todayTrain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 118,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5,
                    color: Theme.of(context).colorScheme.secondaryFixed),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: todayTrain.isLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 2,
                      )
                    : Text(
                        textAlign: TextAlign.center,
                        isActivityTodayExist
                            ? todayTrain.value != null
                                ? todayTrain.value!.percentOfTrainDone
                                    .toString()
                                : 'Пока нет акт'
                            : 'Пока нет активности',
                        style: GoogleFonts.inter(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5,
                    color: Theme.of(context).colorScheme.secondaryFixed),
                borderRadius: BorderRadius.circular(20)),
            height: 118,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                      width: 41,
                      height: 15,
                      child: FittedBox(
                          child: TodayDateHomeScreenText(
                        todayDate: date,
                      ))),
                  Align(
                      alignment: const Alignment(0, 1),
                      child: Image.asset(
                          fit: BoxFit.contain,
                          height: 91.78,
                          'assets/home/graph_today_train.png')),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class InfoAboutTodayNew extends ConsumerWidget {
  const InfoAboutTodayNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayTrain = ref.watch(getTodayTrainInfoDomainProviderAsyncProvider);
    return Container();
  }
}
