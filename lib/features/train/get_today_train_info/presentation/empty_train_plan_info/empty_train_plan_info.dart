import 'package:fitflow/features/train/get_today_train_info/presentation/empty_train_plan_info/components/empty_plan_icon.dart';
import 'package:fitflow/features/train/get_today_train_info/presentation/empty_train_plan_info/components/empty_plan_text.dart';
import 'package:flutter/material.dart';

class EmptyTrainPlanInfo extends StatelessWidget {
  const EmptyTrainPlanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 24,
        left: 24,
        bottom: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [EmptyPlanIconInfo(), EmptyPlanTextInfo()],
      ),
    );
  }
}
