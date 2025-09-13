import 'package:flutter/material.dart';

class MaxLengthDayExercisesInfo extends StatelessWidget {
  const MaxLengthDayExercisesInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: SizedBox(
        height: 65,
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed
          ]).createShader(bounds),
          child: const Text(
              textScaler: TextScaler.linear(1),
              textAlign: TextAlign.center,
              softWrap: true,
              'Согласно текущим исследованиям, пять упражнений достаточно для того, что бы дать необхдимую нагрузку организму.'),
        ),
      ),
    );
  }
}
