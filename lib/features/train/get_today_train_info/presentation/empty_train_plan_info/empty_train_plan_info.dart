import 'package:fitflow/features/train/get_today_train_info/presentation/empty_train_plan_info/components/empty_plan_icon.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/empty_train_plan_info/components/empty_plan_text.dart';
import 'package:flutter/material.dart';

class EmptyTrainPlanInfo extends StatelessWidget {
  const EmptyTrainPlanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 21, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: EmptyPlanIconInfo(),
          ),
          Expanded(child: EmptyPlanTextInfo())
        ],
      ),
    );
  }
}
