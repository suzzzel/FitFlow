import 'package:fitflow/features/train/get_today_train_info/presentation/chill_day_info/components/chill_day_icon.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/chill_day_info/components/chill_day_text.dart';
import 'package:flutter/material.dart';

class ChillDayInfo extends StatelessWidget {
  final int numberOfWeek;
  const ChillDayInfo({super.key, required this.numberOfWeek});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 24, bottom: 31),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChillDayIconInfo(),
              const SizedBox(
                width: 23,
              ),
              ChillDayTextInfo(numberOfWeek: numberOfWeek)
            ],
          ),
        ),
      ],
    );
  }
}
