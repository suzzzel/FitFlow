import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/home/future_profile/presentation/indicators_view/indicators/age_indicator.dart';
import 'package:fitflow/features/home/future_profile/presentation/indicators_view/indicators/height_indicator.dart';
import 'package:fitflow/features/home/future_profile/presentation/indicators_view/indicators/weight_indicator.dart';
import 'package:flutter/material.dart';

class IndicatorsMainWidget extends StatelessWidget {
  final AppUser user;
  const IndicatorsMainWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .primaryFixedDim
                      .withOpacity(0.53),
                  Theme.of(context)
                      .colorScheme
                      .secondaryFixedDim
                      .withOpacity(0.48)
                ])),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 39, right: 39, top: 23, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeightIndicator(weight: user.weight.toString()),
              HeightIndicator(height: user.height.toString()),
              AgeIndicator(age: user.age.toString())
            ],
          ),
        ),
      ),
    );
  }
}
