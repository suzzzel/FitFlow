import 'package:flutter/material.dart';

class ChillDayIconInsideButton extends StatelessWidget {
  const ChillDayIconInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed
            ])),
        width: 56,
        height: 56,
        child: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/home/training_chill.png'),
        ));
  }
}
