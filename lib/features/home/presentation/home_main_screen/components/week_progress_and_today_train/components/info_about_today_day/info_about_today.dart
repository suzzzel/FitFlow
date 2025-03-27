import 'package:fitflow/features/home/presentation/home_main_screen/components/today_date_home_screen_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAboutToday extends StatelessWidget {
  const InfoAboutToday(
      {super.key,
      required this.date,
      required this.isActivityTodayExist,
      this.percentActivity});

  final String date;
  final bool isActivityTodayExist;
  final int? percentActivity;

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  textAlign: TextAlign.center,
                  isActivityTodayExist ? 'АКТИВНОСТЬ ЕСТЬ' : 'АКТИВНОСТИ НЕТ',
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
