import 'package:flutter/material.dart';

class SecondIconStartTrainInsideButton extends StatelessWidget {
  const SecondIconStartTrainInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed.withOpacity(0.3),
              Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.3)
            ])),
        width: 56,
        height: 56,
        child: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/home/training_start_second.png'),
        ));
  }
}
