import 'package:fitflow/features/home/components/today_date_home_screen_text.dart';
import 'package:flutter/material.dart';

class GraphIcon extends StatelessWidget {
  const GraphIcon({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
