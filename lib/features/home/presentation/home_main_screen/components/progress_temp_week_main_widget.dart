import 'package:fitflow/features/db/training_table.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_for_domain.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/providers/get_temp_week_progress_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressTempWeekMainWidget extends StatelessWidget {
  const ProgressTempWeekMainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37, right: 29),
      child: Container(
        height: 198,
        padding: const EdgeInsets.only(left: 15, right: 24, top: 11, bottom: 8),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(42, 44, 56, 1),
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ..._daysOfTempWeek(null),
        ]),
      ),
    );
  }
}

List<Widget> _daysOfTempWeek(TrainingTable? tempWeek) {
  final List<Widget> thisWeek = [];
  String tempDay = '';
  for (int x = 0; x != 7; x++) {
    switch (x) {
      case 0:
        tempDay = 'Пн';
        break;
      case 1:
        tempDay = 'Вт';
        break;
      case 2:
        tempDay = 'Ср';
        break;
      case 3:
        tempDay = 'Чт';
        break;
      case 4:
        tempDay = 'Пт';
        break;
      case 5:
        tempDay = 'Сб';
        break;
      case 6:
        tempDay = 'Вс';
        break;
    }
    thisWeek.add(Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 30,
              height: 154,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(22, 24, 24, 1)),
            ),
            Container(
              width: 30,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
            ),
          ],
        ),
        Text(
          tempDay,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white),
        )
      ],
    ));
  }
  return thisWeek;
}

class NewTempWeekProgress extends ConsumerWidget {
  const NewTempWeekProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressList =
        ref.watch(getTempWeekProgressDomainProviderAsyncProvider);
    return progressList.isLoading
        ? const CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.only(left: 37, right: 29),
            child: Container(
              height: 198,
              padding: const EdgeInsets.only(
                  left: 15, right: 24, top: 11, bottom: 8),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(42, 44, 56, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ..._progressTempWeek(progressList.value!),
                  ]),
            ),
          );
  }

  List<Widget> _progressTempWeek(List<TrainingDayForDomain> tempProgress) {
    final List<Widget> thisWeek = [];
    String tempDay = '';
    for (int x = 0; x != 7; x++) {
      switch (x) {
        case 0:
          tempDay = 'Пн';
          break;
        case 1:
          tempDay = 'Вт';
          break;
        case 2:
          tempDay = 'Ср';
          break;
        case 3:
          tempDay = 'Чт';
          break;
        case 4:
          tempDay = 'Пт';
          break;
        case 5:
          tempDay = 'Сб';
          break;
        case 6:
          tempDay = 'Вс';
          break;
      }
      thisWeek.add(Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 30,
                height: 154,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(22, 24, 24, 1)),
              ),
              Container(
                width: 30,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        tempProgress[x].isChillDay ? Colors.green : Colors.red),
              ),
            ],
          ),
          Text(
            tempDay,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white),
          )
        ],
      ));
    }
    return thisWeek;
  }
}
